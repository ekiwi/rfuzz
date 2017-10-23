extern crate libc;

use std;

pub trait SharedMemory {
	fn create(size: usize) -> Self;
	fn id(&self) -> i32;
	fn reset(&mut self);
}

/// similar to the `std::Read` trait, but with some additional functions
pub trait Readable {
	fn bytes_left_to_read(&self) -> usize;
	fn reset_read_offset(&mut self);
	fn read_bytes<'a, 'b: 'a>(&'b mut self, len: usize) -> Result<(&'a [u8]), ()>;

	fn read_skip_bytes(&mut self, len: usize) -> Result<(),()> {
		self.read_bytes(len)?;
		Ok(())
	}

	fn read_u32(&mut self) -> Result<u32, ()> {
		let data = self.read_bytes(4)?;
		let val = (data[3] as u32) << 24 | (data[2] as u32) << 16 |
		          (data[1] as u32) <<  8 | (data[0] as u32) <<  0;
		Ok(val)
	}

	fn read_u64(&mut self) -> Result<u64, ()> {
		let data = self.read_bytes(8)?;
		let val = (data[7] as u64) << 56 | (data[6] as u64) << 48 |
		          (data[5] as u64) << 40 | (data[4] as u64) << 32 |
		          (data[3] as u64) << 24 | (data[2] as u64) << 16 |
		          (data[1] as u64) <<  8 | (data[0] as u64) <<  0;
		Ok(val)
	}
}

/// similar to the `std::Write` trait, but with some additional functions
pub trait Writeable {
	fn bytes_left_to_write(&self) -> usize;
	fn reset_write_offset(&mut self);
	fn write_all(&mut self, buf: &[u8]) -> Result<(), ()>;

	fn write_u32(&mut self, val: u32) -> Result<(), ()> {
		let data = [(val >>  0) as u8, (val >>  8) as u8,
		            (val >> 16) as u8, (val >> 24) as u8];
		self.write_all(&data)
	}

	fn write_u64(&mut self, val: u64) -> Result<(), ()> {
		let data = [(val >>  0) as u8, (val >>  8) as u8,
		            (val >> 16) as u8, (val >> 24) as u8,
		            (val >> 32) as u8, (val >> 40) as u8,
		            (val >> 48) as u8, (val >> 56) as u8];
		self.write_all(&data)
	}
}

struct SharedMemoryPosix {
	data: *mut u8,
	size: usize,
	id: i32,
}

impl SharedMemory for SharedMemoryPosix {
	fn create(size: usize) -> SharedMemoryPosix {
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
		SharedMemoryPosix { id: shm_id, size: size, data: ptr }
	}

	fn reset(&mut self) {
		unsafe { libc::memset(self.data as *mut libc::c_void, 0, self.size) };
	}

	fn id(&self) -> i32 { self.id }
}

impl Drop for SharedMemoryPosix {
	fn drop(&mut self) {
		// println!("SharedMemory.drop: {}", self.id);
		unsafe { libc::shmctl(self.id, libc::IPC_RMID, std::ptr::null_mut()) };
	}
}

pub struct WriteableSharedMemory {
	mem: SharedMemoryPosix,
	offset: usize,
}

impl SharedMemory for WriteableSharedMemory {
	fn create(size: usize) -> WriteableSharedMemory {
		let mem = SharedMemoryPosix::create(size);
		let offset = 0;
		WriteableSharedMemory { mem, offset }
	}
	fn reset(&mut self) { self.mem.reset() }
	fn id(&self) -> i32 { self.mem.id() }
}

impl Writeable for WriteableSharedMemory {
	fn bytes_left_to_write(&self) -> usize {
		self.mem.size - self.offset
	}

	fn write_all(&mut self, buf: &[u8]) -> Result<(), ()> {
		if buf.len() > self.bytes_left_to_write() { Err(()) }
		else {
			let len = buf.len();
			let dst = unsafe{ self.mem.data.offset(self.offset as isize) } as *mut libc::c_void;
			let src = buf.as_ptr() as *const libc::c_void;
			unsafe { libc::memcpy(dst, src, len) };
			self.offset += len;
			Ok(())
		}
	}

	fn reset_write_offset(&mut self) { self.offset = 0 }
}

impl Readable for WriteableSharedMemory {
	fn bytes_left_to_read(&self) -> usize {
		self.mem.size - self.offset
	}

	fn read_bytes<'a, 'b: 'a>(&'b mut self, len: usize) -> Result<(&'a [u8]), ()> {
		if len > self.bytes_left_to_read() { Err(()) }
		else {
			let bytes = unsafe { std::slice::from_raw_parts_mut(
			                     self.mem.data.offset(self.offset as isize), len) };
			self.offset += len;
			Ok(bytes)
		}
	}

	fn reset_read_offset(&mut self) { self.offset = 0 }
}

pub struct ReadableSharedMemory {
	mem: SharedMemoryPosix,
	offset: usize,
}

impl SharedMemory for ReadableSharedMemory {
	fn create(size: usize) -> ReadableSharedMemory {
		let mem = SharedMemoryPosix::create(size);
		let offset = 0;
		ReadableSharedMemory { mem, offset }
	}
	fn reset(&mut self) { self.mem.reset() }
	fn id(&self) -> i32 { self.mem.id() }
}

impl Readable for ReadableSharedMemory {
	fn bytes_left_to_read(&self) -> usize {
		self.mem.size - self.offset
	}

	fn read_bytes<'a, 'b: 'a>(&'b mut self, len: usize) -> Result<(&'a [u8]), ()> {
		if len > self.bytes_left_to_read() { Err(()) }
		else {
			let bytes = unsafe { std::slice::from_raw_parts_mut(
			                     self.mem.data.offset(self.offset as isize), len) };
			self.offset += len;
			Ok(bytes)
		}
	}

	fn reset_read_offset(&mut self) { self.offset = 0 }
}
