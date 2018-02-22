extern crate libc;

use std;
use std::io::{Read, Write, Seek, SeekFrom};
use std::fs;
use std::path;
use std::os::unix::io::AsRawFd;
use super::buffered::{ CommunicationBuffer, CommunicationChannel };
use super::rwint::{ ReadIntsBigEndian, WriteIntsBigEndian };

pub struct SharedMemory {
	data: *mut u8,
	size: usize,
	id: i32,
	offset: usize,
}

impl SharedMemory {
	pub fn create(size: usize) -> SharedMemory {
		let shm_id = unsafe {
			libc::shmget(libc::IPC_PRIVATE, size,
						 libc::IPC_CREAT | libc::IPC_EXCL | 0o600)
			};
		assert!(shm_id >= 0);
		let data = unsafe { libc::shmat(shm_id, std::ptr::null_mut(), 0) };
		if data as i64 == -1 {
			panic!("failed to allocate shared memory: {:?}", std::io::Error::last_os_error());
		}
		// println!("SharedMemory.create: id={}, data={:?}", shm_id, data);
		let ptr = data as *mut u8;
		SharedMemory { id: shm_id, size: size, data: ptr, offset: 0 }
	}

	fn reset(&mut self) {
		unsafe { libc::memset(self.data as *mut libc::c_void, 0, self.size) };
	}

	pub fn id(&self) -> i32 { self.id }

	fn bytes_left(&self) -> usize {
		self.size - self.offset
	}
}

impl Drop for SharedMemory {
	fn drop(&mut self) {
		// println!("SharedMemory.drop: {}", self.id);
		unsafe { libc::shmctl(self.id, libc::IPC_RMID, std::ptr::null_mut()) };
	}
}


impl Write for SharedMemory {
	fn write(&mut self, buf: &[u8]) -> std::io::Result<usize> {
		let len = std::cmp::min(buf.len(), self.bytes_left());
		let dst = unsafe{ self.data.offset(self.offset as isize) } as *mut libc::c_void;
		let src = buf.as_ptr() as *const libc::c_void;
		unsafe { libc::memcpy(dst, src, len) };
		self.offset += len;
		Ok(len)
	}
	fn flush(&mut self) -> std::io::Result<()> { Ok(()) }
}

impl Read for SharedMemory {
	fn read(&mut self, buf: &mut [u8]) -> std::io::Result<usize> {
		let len = std::cmp::min(buf.len(), self.bytes_left());
		let src = unsafe{ self.data.offset(self.offset as isize) } as *const libc::c_void;
		let dst = buf.as_ptr() as *mut libc::c_void;
		unsafe { libc::memcpy(dst, src, len) };
		self.offset += len;
		Ok(len)
	}
}

impl Seek for SharedMemory {
	fn seek(&mut self, pos: SeekFrom) -> std::io::Result<u64> {
		let new_offset = match pos {
			SeekFrom::Start(o) => o as i64,
			SeekFrom::End(o) => self.size as i64 + o,
			SeekFrom::Current(o) => self.offset as i64 + o,
		};
		if new_offset < 0 || new_offset >= self.size as i64 {
			Err(std::io::Error::new(std::io::ErrorKind::Other, "out of bounds"))
		} else {
			self.offset = new_offset as usize;
			Ok(new_offset as u64)
		}
	}
}

impl ReadIntsBigEndian for SharedMemory {}
impl WriteIntsBigEndian for SharedMemory {}

impl CommunicationBuffer for SharedMemory {
	fn len(&self) -> usize { self.size }
	fn get_ref<'a, 'b: 'a>(&'b mut self, len: usize) -> std::io::Result<(&'a [u8])> {
		if len > self.bytes_left() {
			Err(std::io::Error::new(std::io::ErrorKind::Other, "not enough data"))
		} else {
			let bytes = unsafe { std::slice::from_raw_parts_mut(
			self.data.offset(self.offset as isize), len) };
			self.offset += len;
			Ok(bytes)
		}
	}
}


/// uses two Posix FIFOs to communicate buffer ids
pub struct SharedMemoryChannel {
	tx: fs::File,
	rx: fs::File,
	channel_size: usize,
}

#[derive(Clone, Copy, PartialEq)]
pub struct SharedMemoryToken(u32, u32);

impl CommunicationChannel for SharedMemoryChannel {
	type BufferT = SharedMemory;
	type TokenT = SharedMemoryToken;
	fn get_token(tx: &Self::BufferT, rx: &Self::BufferT) -> Self::TokenT {
		SharedMemoryToken(tx.id() as u32, rx.id() as u32)
	}
	fn alloc(&mut self, size: usize) -> Self::BufferT {
		SharedMemory::create(size)
	}
	fn try_send(&mut self, token: Self::TokenT, _: usize, _: usize) -> Result<(), ()> {
		if self.full() { Err(()) } else {
			self.send(token);
			Ok(())
		}
	}
	fn try_receive(&mut self) -> Option<Self::TokenT> {
		if let Some((id0, id1)) = self.try_recv_ids() {
			self.channel_size -= 1;
			Some(SharedMemoryToken(id0, id1))
		} else { None }
	}
	/// blocking receive, will panic if nothing was sent
	fn receive(&mut self) -> Self::TokenT {
		assert!(self.channel_size > 0, "empty channel!");
		let (id0, id1) = self.recv_ids();
		self.channel_size -= 1;
		SharedMemoryToken(id0, id1)
	}
}

impl SharedMemoryChannel {
	pub fn connect(dir: &path::Path) -> Option<Self> {
		// open pipes in the same order as the fpga mockup interface server does
		// (see hardware-afl:src/fpga_queue.cpp
		let tx_path = dir.join("tx.fifo");
		let tx = fs::File::open(&tx_path).expect("failed to open tx fifo!");
		// the receive pipe of the fuzz server needs to be opened write only
		// in order to fullfill the fifo interface
		let rx_path = dir.join("rx.fifo");
		let rx = fs::OpenOptions::new().write(true).open(&rx_path).expect("failed to open rx fifo!");
		let channel_size = 0;
		Some(SharedMemoryChannel { tx, rx, channel_size })
	}

	fn u32_to_bytes(ii: u32) -> [u8; 4] {
		[(ii >>  0) as u8, (ii >>  8) as u8,
		 (ii >> 16) as u8, (ii >> 24) as u8]
	}

	fn u32_from_bytes(dd: &[u8]) -> u32 {
		(((dd[0] as u32) <<  0) | ((dd[1] as u32) <<  8) |
		 ((dd[2] as u32) << 16) | ((dd[3] as u32) << 24))
	}

	fn send_id(&mut self, id: u32) {
		//println!("sending id: {}", id);
		self.rx.write(&SharedMemoryChannel::u32_to_bytes(id)).unwrap();
	}

	fn send_ids(&mut self, id_tx: u32, id_rx: u32) {
		self.send_id(id_tx); self.send_id(id_rx);
	}

	fn has_data(file: &fs::File, _min_size: usize) -> bool {
		let fd = file.as_raw_fd();
		// TODO: we are currently not enforcing the `min_size`.
		//       How could that be implemented?
		let ret = unsafe {
			let mut poll_fd = libc::pollfd { fd, events: libc::POLLIN, revents: 0 };
			libc::poll(&mut poll_fd as *mut libc::pollfd, 1, 0)
		};
		ret == 1
	}

	fn try_recv_ids(&mut self) -> Option<(u32, u32)> {
		// WARN: this code has a potential race condition since the `has_data`
		//       check and the `read` call are not atomic.
		//       If someone else was to read from the FIFO after our `has_data`
		//       call, the `read` call might block!
		if SharedMemoryChannel::has_data(&self.tx, 8) {
			Some(self.recv_ids())
		} else { None }
	}

	fn recv_ids(&mut self) -> (u32, u32) {
		let mut rb = [0;8];
		assert_eq!(self.tx.read(&mut rb).expect("failed to read from tx pipe"), 8, "tx pipe was closed unexpectedly!");
		let id_rx = SharedMemoryChannel::u32_from_bytes(&rb[..4]);
		let id_tx = SharedMemoryChannel::u32_from_bytes(&rb[4..]);
		(id_tx, id_rx)
	}

	/// blocking send
	fn send(&mut self, token: SharedMemoryToken) {
		assert!(!self.full(), "full channel!");
		self.send_ids(token.0, token.1);
		self.channel_size += 1;
	}

	fn full(&self) -> bool { false }
	// fn full(&self) -> bool { self.channel_size > 0 }
}
