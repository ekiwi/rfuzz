// simple rust interface to some of the PYNQ peripherals
// copied from https://github.com/ekiwi/pynq

extern crate libc;
use std;
use std::ffi::CString;
use std::ops::{Drop};
use std::io::{Read, Write, Seek, SeekFrom};
use std::fs::File;
use super::buffered::CommunicationBuffer;
use super::rwint::{ ReadIntsBigEndian, WriteIntsBigEndian };

#[derive(Copy, Clone, Debug)]
pub struct Clock { pub div0 : u32, pub div1 : u32 }

pub fn load_bitstream(filename: &str, clocks: &[Clock]) -> Result<usize, String> {
	let mut buf = Vec::new();
	load_bitstream_data(filename, &mut buf);
	configure_clocks(clocks);
	set_partial_bitstream(false);
	write_bitstream_data(&buf);
	Ok(buf.len())
}

fn configure_clocks(clocks: &[Clock]) {
	assert!(clocks.len() >  0, "Need to enable at least 1 clock!");
	assert!(clocks.len() <= 4, "Only four clocks (FCLK{0-3}) can be configured!");
	let disabled = Clock { div0 : 0, div1: 0 };
	let base_addr = 0xf8000000;
	fn offset(ii : usize) -> usize { (0x170 / 4) + (ii * (0x10 / 4)) }
	let mut mem = MemoryMappedIO::map(base_addr, 0x170 + 0x10 * 4);
	for (ii, clk) in clocks.iter().enumerate() {
		let old = mem.read(offset(ii));
		mem.write(offset(ii), calc_divs(clk, old));
	}
	for ii in clocks.len()..4 {
		let old = mem.read(offset(ii));
		mem.write(offset(ii), calc_divs(&disabled, old));
	}
}

fn calc_divs(clk: &Clock, old : u32) -> u32 {
	(old & !((0x3f << 20) | (0x3f << 8))) |
	(((clk.div1 & 0x3f) << 20) | ((clk.div0 & 0x3f) << 8))
}

fn set_partial_bitstream(enabled : bool) {
	let partial_bitstream = "/sys/devices/soc0/amba/f8007000.devcfg/is_partial_bitstream";
	let mut file = File::create(partial_bitstream).expect("Failed to open partial bitstream file!");
	file.write(if enabled { b"1" } else { b"0" }).unwrap();
}

fn load_bitstream_data(filename : &str, buf: &mut Vec<u8>) {
	let mut file = File::open(filename).expect("Failed to open bitstream file!");
	file.read_to_end(buf).expect("Failed to read bitstream file!");
}

fn write_bitstream_data(buf : &[u8]) {
	let mut file = File::create("/dev/xdevcfg").unwrap();
	file.write_all(buf).expect("Failed to write bitstream to FPGA");
}

// Xilinx has their own little kitchensink driver that allows access to various
// DMAs and allocation of continous chunks of physical memory from userspace.
// It can be found in `drivers/staging/apf/` in the Xilinx linux kernel repository.
// We only need it in order to allocate CMA buffers to use with our DMA.
// To use the DMA, we don't use the kernel but write to physical memory directly.

// from `drivers/staging/apf/xlnk-ioctl.h`
const XLNK_IOCALLOCBUF : libc::c_ulong = 0xc0045802;
const XLNK_IOCFREEBUF  : libc::c_ulong = 0xc0045803;

// from `drivers/staging/apf/xlnk.h`
#[repr(C)]
struct AllocBufIoctlArg { len: u32, id: i32, phyaddr : u32, cacheable : u8 }
#[repr(C)]
struct FreeBufIoctlArg { id: u32, buf : u32 }

/// thin wrapper arond the /dev/xlnk pseudo file
struct Xlnk { fd : libc::c_int }
impl Xlnk {
	fn open() -> Self {
		let pseudo_file = CString::new("/dev/xlnk").unwrap();
		let fd = unsafe { libc::open(pseudo_file.as_ptr(), libc::O_RDWR) };
		assert!(fd > -1, "Failed to open /dev/xlnk.");
		Xlnk { fd }
	}
	fn alloc_buf(&mut self, length : usize, is_cacheable : bool) -> (u32, u32) {
		let mut args = AllocBufIoctlArg {
			len: length as u32, id: -1, phyaddr: 0,
			cacheable: if is_cacheable { 1 } else { 0 }
		};
		let ret = unsafe { libc::ioctl(self.fd, XLNK_IOCALLOCBUF, &mut args) };
		assert!(ret >= 0, "xlnk.alloc_buf failed!");
		(args.id as u32, args.phyaddr)
	}
	fn free_buf(&mut self, id : u32) {
		let mut args = FreeBufIoctlArg { id : id, buf: 0 };
		let ret = unsafe { libc::ioctl(self.fd, XLNK_IOCFREEBUF, &mut args) };
		assert!(ret >= 0, "xlnk.free_buf failed!");
	}
	unsafe fn mmap_buffer(&mut self, id : u32, length : usize) -> *mut libc::c_void {
		let offset = id << 24;
		let mm = libc::mmap(std::ptr::null_mut(), length,
		                    libc::PROT_READ | libc::PROT_WRITE,
		                    libc::MAP_SHARED | libc::MAP_LOCKED,
		                    self.fd, offset as libc::c_long);
		assert!(mm != libc::MAP_FAILED, "Failed to mmap DMA buffer.");
		mm
	}
}
impl Drop for Xlnk {
	fn drop(&mut self) {
		assert!(unsafe { libc::close(self.fd) } == 0, "Failed to close /dev/xlnk.");
	}
}

pub struct DmaBuffer { id : u32, physical_addr : u32, data: *mut u8, size: usize, offset: usize }

#[derive(Clone, Copy, Debug, PartialEq)]
/// esentially all identifying data of a DmaBuffer without the data so that it can be copied
pub struct DmaBufferId { id: u32, physical_addr: u32 }

impl DmaBuffer {
	pub fn allocate(size : usize) -> Self {
		let mut xlnk = Xlnk::open();
		let (id, physical_addr) = xlnk.alloc_buf(size, false);
		let data = unsafe { xlnk.mmap_buffer(id, size) } as *mut u8;
		let offset = 0;
		DmaBuffer { id, physical_addr, data, size, offset }
	}
	fn bytes_left(&self) -> usize {
		self.size - self.offset
	}
	pub fn id(&self) -> DmaBufferId {
		DmaBufferId { id: self.id, physical_addr: self.physical_addr }
	}
}
impl Write for DmaBuffer {
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

impl Read for DmaBuffer {
	fn read(&mut self, buf: &mut [u8]) -> std::io::Result<usize> {
		let len = std::cmp::min(buf.len(), self.bytes_left());
		let src = unsafe{ self.data.offset(self.offset as isize) } as *const libc::c_void;
		let dst = buf.as_ptr() as *mut libc::c_void;
		unsafe { libc::memcpy(dst, src, len) };
		self.offset += len;
		Ok(len)
	}
}

impl Seek for DmaBuffer {
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

impl Drop for DmaBuffer {
	fn drop(&mut self) {
		let mm = self.data as *mut libc::c_void;
		assert!(unsafe { libc::munmap(mm, self.size) } == 0, "Failed to unmap DMA buffer.");
		Xlnk::open().free_buf(self.id);
	}
}

impl ReadIntsBigEndian for DmaBuffer {}
impl WriteIntsBigEndian for DmaBuffer {}

impl CommunicationBuffer for DmaBuffer {
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


pub struct Dma {
	mem : MemoryMappedIO,
	tx_buffer : Option<DmaBufferId>,
	rx_buffer : Option<DmaBufferId>,
}

impl Dma {
	// TODO: support interrupts
	pub fn get() -> Self {
		let mem = MemoryMappedIO::map(0x40000000, 2 * 0x30);
		let mut dma = Dma { mem, tx_buffer: None, rx_buffer: None };
		dma.start();
		dma
	}
	fn start(&mut self) {
		// TODO: add timeout
		self.mem.write( 0, 0x00000001);
		self.mem.write(12, 0x00000001);
		while !((self.mem.read(1) & 1 == 0) && (self.mem.read(12+1) & 1 == 0)) { }
	}
	fn is_tx_idle(&mut self) -> bool { self.mem.read(   1) & 2 == 2 }
	fn is_rx_idle(&mut self) -> bool { self.mem.read(12+1) & 2 == 2 }
	pub fn start_send(&mut self, buf : DmaBufferId, bytes: u32) {
		assert!(self.tx_buffer.is_none(), "Cannot send when transmission is in progress!");
		self.mem.write( 6, buf.physical_addr);
		self.mem.write(10, bytes);
		self.tx_buffer = Some(buf);
	}
	pub fn is_send_done(&mut self) -> bool { self.is_tx_idle() }
	pub fn finish_send(&mut self) -> DmaBufferId {
		assert!(self.is_send_done(), "Cannot finish send when transmission hasn't finished!");
		assert!(self.tx_buffer.is_some(), "Cannot finish send when no transmission was started!");
		let mut buf = None;
		std::mem::swap(&mut buf, &mut self.tx_buffer);
		buf.unwrap()
	}
	pub fn start_receive(&mut self, buf : DmaBufferId, bytes: u32) {
		assert!(self.rx_buffer.is_none(), "Cannot receive when transmission is in progress!");
		self.mem.write(12+ 6, buf.physical_addr);
		self.mem.write(12+10, bytes);
		self.rx_buffer = Some(buf);
	}
	pub fn is_receive_done(&mut self) -> bool { self.is_rx_idle() }
	pub fn finish_receive(&mut self) -> DmaBufferId {
		assert!(self.is_receive_done(), "Cannot finish receive when transmission hasn't finished!");
		assert!(self.rx_buffer.is_some(), "Cannot finish receive when no transmission was started!");
		let mut buf = None;
		std::mem::swap(&mut buf, &mut self.rx_buffer);
		buf.unwrap()
	}
}

struct MemoryMappedIO {
	mem : *mut u32,
	words : usize,
}

impl MemoryMappedIO {
	fn map(phys_addr : u32, length : u32) -> Self {
		let page_size = unsafe { libc::sysconf(libc::_SC_PAGESIZE) } as u32;
		assert!(phys_addr % page_size == 0, "Only page boundary aligned IO is supported!");
		let phys_mem = CString::new("/dev/mem").unwrap();
		let words = ((length + 3) / 4) as usize;
		let mem = unsafe {
			let fd = libc::open(phys_mem.as_ptr(), libc::O_RDWR | libc::O_SYNC);
			assert!(fd > -1, "Failed to open /dev/mem. Are we root?");
			let mm = libc::mmap(std::ptr::null_mut(), words * 4,
			                    libc::PROT_READ | libc::PROT_WRITE,
			                    libc::MAP_SHARED, fd, phys_addr as libc::c_long);
			assert!(mm != libc::MAP_FAILED, "Failed to mmap physical memory.");
			assert!(libc::close(fd) == 0, "Failed to close /dev/mem.");
			mm as *mut u32
		};
		MemoryMappedIO { mem, words }
	}
	fn write(&mut self, offset : usize, value : u32) {
		unsafe { std::ptr::write_volatile(self.mem.offset(offset as isize), value) }
	}
	fn read(&mut self, offset : usize) -> u32 {
		unsafe { std::ptr::read_volatile(self.mem.offset(offset as isize)) }
	}
}

impl Drop for MemoryMappedIO {
	fn drop(&mut self) {
		unsafe {
			assert!(
				libc::munmap(self.mem as *mut libc::c_void, self.words * 4) == 0,
				"Failed to unmap IO.");
		}
	}
}
