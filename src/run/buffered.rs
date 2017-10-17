use std::fs;
use std::path;
use std::io::prelude::*;
use super::shmem::{ SharedMemory, WriteableSharedMemory, ReadableSharedMemory };

const MAGIC_HEADER: u32 = 0x19933991;
const MAGIC_COV_HEADER: u32 = 0x73537353;


#[derive(Copy, Clone)]
pub struct TestSize {
	pub coverage: usize,
	pub input: usize,
}

impl TestSize {
	fn new(coverage_size: usize, input_size: usize) -> Self {
		assert_eq!(coverage_size % 4, 0);
		assert_eq!(input_size % 4, 0);
		TestSize { coverage: coverage_size, input: input_size }
	}
}


pub struct TestBuffer {
	size: TestSize,
	data: WriteableSharedMemory,
	test_count: u32,
}
impl TestBuffer {
	pub fn create(size: TestSize, buffer_size: usize) -> Self {
		let mut data = WriteableSharedMemory::create(buffer_size);
		let mut buf = TestBuffer { size, data, test_count: 0 };
		buf.reset();
		buf
	}

	fn reset(&mut self) {
		self.test_count = 0;
		self.data.reset_write_offset();
		self.data.write_u32(MAGIC_HEADER).unwrap();
		self.data.write_u32(self.test_count).unwrap();
	}

	pub fn add_test(&mut self, id: u64, inputs: &[u8]) -> Result<(), ()> {
		if inputs.len() % self.size.input != 0 { return Err(()); }
		self.data.write_u64(id)?;
		let input_count = (inputs.len() / self.size.input) as u32;
		self.data.write_u32(input_count)?;
		self.data.write_all(inputs)?;
		//self.data.write_zeros(self.size.coverage)?;
		self.test_count += 1;
		Ok(())
	}

	fn finalize(&mut self) -> i32 {
		self.data.reset_write_offset();
		self.data.write_u32(MAGIC_HEADER).unwrap();
		self.data.write_u32(self.test_count).unwrap();
		self.data.id()
	}

	fn reactivate(mut self, id: i32) -> Option<Self> {
		if id == self.data.id() { self.reset(); Some(self) }
		else { None }
	}

	pub fn is_empty(&self) -> bool { self.test_count == 0 }
}

pub struct CoverageBuffer {
	size: TestSize,
	data: ReadableSharedMemory,
	test_count: u32,
}
impl<'a> CoverageBuffer {
	pub fn create(size: TestSize, buffer_size: usize) -> Self {
		let mut data = ReadableSharedMemory::create(buffer_size);
		CoverageBuffer { size, data, test_count: 0 }
	}

	fn read_header(&mut self) {
		self.data.reset_read_offset();
		let magic = self.data.read_u32().unwrap();
		assert_eq!(magic, MAGIC_COV_HEADER);
		self.test_count = self.data.read_u32().unwrap();
	}

	pub fn get_coverage(&'a mut self) -> Option<(u64,&'a [u8])> {
		if self.test_count > 0 {
			let id = self.data.read_u64().unwrap();
			let cov = self.data.read_bytes(self.size.coverage).unwrap();
			self.test_count -= 1;
			Some((id, cov))
		} else { None }
	}

	fn finalize(&mut self) -> i32 {
		self.data.id()
	}

	fn reactivate(mut self, id: i32) -> Option<Self> {
		if id == self.data.id() { self.read_header(); Some(self) }
		else { None }
	}

	fn is_empty(&self) -> bool { self.test_count == 0 }
}

pub struct FuzzServer {
	name: String,
	tx: fs::File,
	rx: fs::File,
	// this is a work around because I suck at rust....
	// this vector will only ever contain 0 or 1 buffer
	test_buffer: Vec<TestBuffer>,
	coverage_buffer: Vec<CoverageBuffer>
}

impl FuzzServer {
	pub fn connect(dir: &path::Path) -> Option<Self> {
		let name = dir.file_name().unwrap().to_os_string().into_string().unwrap();

		// open pipes in the same order as the fpga mockup interface server does
		// (see hardware-afl:src/fpga_queue.cpp
		let tx_path = dir.join("tx.fifo");
		let tx = fs::File::open(&tx_path).expect("failed to open tx fifo!");
		println!("Sucessfully opened {} to communicate with FuzzServer {}",
			     tx_path.display(), name);
		// the receive pipe of the fuzz server needs to be opened write only
		// in order to fullfill the fifo interface
		let rx_path = dir.join("rx.fifo");
		let rx = fs::OpenOptions::new().write(true).open(&rx_path).expect("failed to open rx fifo!");
		println!("Sucessfully opened {} to communicate with FuzzServer {}",
			     tx_path.display(), name);
		Some(FuzzServer { name, tx, rx, test_buffer: Vec::new(), coverage_buffer: Vec::new() })
	}

	fn send_id(&mut self, id: u32) {
		//println!("sending id: {}", id);
		self.rx.write(&[((id as u32) >>  0) as u8, ((id as u32) >>  8) as u8,
		                ((id as u32) >> 16) as u8, ((id as u32) >> 24) as u8]).unwrap();
	}

	pub fn push_buffer(&mut self, mut test: TestBuffer, mut cov: CoverageBuffer) {
		self.send_id(test.finalize() as u32);
		self.test_buffer.push(test);
		self.send_id(cov.finalize() as u32);
		self.coverage_buffer.push(cov);
	}

	fn recv_id(&mut self) -> u32 {
		let mut rb = [0;4];
		assert_eq!(self.tx.read(&mut rb).expect("failed to read from tx pipe"), 4);
		(((rb[0] as u32) <<  0) | ((rb[1] as u32) <<  8) |
		 ((rb[2] as u32) << 16) | ((rb[3] as u32) << 24))
	}

	pub fn pop_buffer(&mut self) -> Option<(TestBuffer, CoverageBuffer)> {
		if self.test_buffer.len() < 1 || self.coverage_buffer.len() < 1 { return None; }
		// wait for fuzz server to return the bffers to us
		let cov_id = self.recv_id() as i32;
		//println!("received id: {}", cov_id);
		let test_id = self.recv_id() as i32;
		//println!("received id: {}", test_id);
		let test = self.test_buffer.pop().and_then(|b| b.reactivate(test_id));
		let cov  = self.coverage_buffer.pop().and_then(|b| b.reactivate(cov_id));
		if let (Some(t), Some(c)) = (test, cov) { Some((t,c)) } else { None }
	}
}

pub fn list_potential_fuzz_servers(server_dir: &str) {
	let paths = fs::read_dir(server_dir).expect("failed to open fuzz server directory!");
	for entry in paths.filter_map(|path| path.ok().and_then(|p| Some(p.path()))) {
		if entry.is_dir() {
			let name = entry.file_name().unwrap().to_os_string().into_string().unwrap();
			println!("found fuzz server: {}", name);
		}
	}
}

pub fn find_one_fuzz_server(server_dir: &str) -> Option<FuzzServer> {
	let paths = fs::read_dir(server_dir).expect("failed to open fuzz server directory!");
	for entry in paths.filter_map(|path| path.ok().and_then(|p| Some(p.path()))) {
		if entry.is_dir() {
			if let Some(server) = FuzzServer::connect(&entry) {
				return Some(server);
			}
		}
	}
	None
}

