extern crate libc;

use std::mem;
use std::fs;
use std::path;
use std::io::prelude::*;
use std::os::unix::io::AsRawFd;
use super::shmem::{ SharedMemory, Writeable, Readable, WriteableSharedMemory, ReadableSharedMemory };
use super::{ TestId, BasicFeedback, FuzzServer };
use super::super::mutation::{ MutationInfo, MutationAlgorithmId, MutationId };
use std::collections::VecDeque;

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


struct TestBuffer {
	size: TestSize,
	data: WriteableSharedMemory,
	test_count: u32,
}
impl TestBuffer {
	fn create(size: TestSize, buffer_size: usize) -> Self {
		let data = WriteableSharedMemory::create(buffer_size);
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

	fn add_test(&mut self, id: TestId, inputs: &[u8]) -> Result<(), ()> {
		if inputs.len() % self.size.input != 0 { return Err(()); }
		self.data.write_u64(id.0)?;
		let input_count = (inputs.len() / self.size.input) as u32;
		self.data.write_u32(input_count)?;
		self.data.write_all(inputs)?;
		//self.data.write_zeros(self.size.coverage)?;
		self.test_count += 1;
		Ok(())
	}

	fn find_test(&mut self, id: TestId) -> Option<&[u8]> {
		while self.test_count > 0 {
			let cur_test_id = self.data.read_u64().unwrap();
			let input_count = self.data.read_u32().unwrap();
			let len = input_count as usize * self.size.input;
			self.test_count -= 1;
			if TestId(cur_test_id) == id {
				let inputs = self.data.read_bytes(len).unwrap();
				return Some(inputs);
			} else {
				self.data.read_skip_bytes(len).unwrap();
			}
		}
		None
	}

	fn finalize(&mut self) -> i32 {
		self.data.reset_write_offset();
		self.data.write_u32(MAGIC_HEADER).unwrap();
		self.data.write_u32(self.test_count).unwrap();
		self.data.id()
	}

	fn reactivate(mut self, id: i32) -> Option<Self> {
		if self.is_id(id) {
			self.data.reset_read_offset();
			assert_eq!(self.data.read_u32().unwrap(), MAGIC_HEADER);
			assert_eq!(self.data.read_u32().unwrap(), self.test_count);
			Some(self)
		} else { None }
	}

	fn is_empty(&self) -> bool { self.test_count == 0 }
	fn is_id(&self, id: i32) -> bool { self.data.id() == id }
}

struct CoverageBuffer {
	size: TestSize,
	data: ReadableSharedMemory,
	test_count: u32,
}
impl<'a> CoverageBuffer {
	pub fn create(size: TestSize, buffer_size: usize) -> Self {
		let data = ReadableSharedMemory::create(buffer_size);
		CoverageBuffer { size, data, test_count: 0 }
	}

	fn read_header(&mut self) {
		self.data.reset_read_offset();
		let magic = self.data.read_u32().unwrap();
		assert_eq!(magic, MAGIC_COV_HEADER);
		self.test_count = self.data.read_u32().unwrap();
	}

	pub fn get_coverage(&'a mut self) -> Option<(TestId,&'a [u8])> {
		if self.test_count > 0 {
			let id = TestId(self.data.read_u64().unwrap());
			let cov = self.data.read_bytes(self.size.coverage).unwrap();
			self.test_count -= 1;
			Some((id, cov))
		} else { None }
	}

	fn finalize(&mut self) -> i32 {
		self.data.id()
	}

	fn reactivate(mut self, id: i32) -> Option<Self> {
		if self.is_id(id) { self.read_header(); Some(self) } else { None }
	}

	fn is_empty(&self) -> bool { self.test_count == 0 }
	fn is_id(&self, id: i32) -> bool { self.data.id() == id }
}

/// uses two Posix FIFOs to communicate buffer ids
struct MetaChannel {
	tx: fs::File,
	rx: fs::File,
}

impl MetaChannel {
	fn connect(dir: &path::Path) -> Option<Self> {
		// open pipes in the same order as the fpga mockup interface server does
		// (see hardware-afl:src/fpga_queue.cpp
		let tx_path = dir.join("tx.fifo");
		let tx = fs::File::open(&tx_path).expect("failed to open tx fifo!");
		// the receive pipe of the fuzz server needs to be opened write only
		// in order to fullfill the fifo interface
		let rx_path = dir.join("rx.fifo");
		let rx = fs::OpenOptions::new().write(true).open(&rx_path).expect("failed to open rx fifo!");
		Some(MetaChannel { tx, rx })
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
		self.rx.write(&MetaChannel::u32_to_bytes(id)).unwrap();
	}

	fn send_ids(&mut self, id0: u32, id1: u32) {
		self.send_id(id0); self.send_id(id1);
	}

	fn has_data(file: &fs::File, min_size: usize) -> bool {
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
		if MetaChannel::has_data(&self.tx, 8) {
			Some(self.recv_ids())
		} else { None }
	}

	fn recv_ids(&mut self) -> (u32, u32) {
		let mut rb = [0;8];
		assert_eq!(self.tx.read(&mut rb).expect("failed to read from tx pipe"), 8);
		let id0 = MetaChannel::u32_from_bytes(&rb[..4]);
		let id1 = MetaChannel::u32_from_bytes(&rb[4..]);
		(id0, id1)
	}
}

#[derive(Clone)]
struct MutationInterval { start: TestId, stop: TestId, algo: MutationAlgorithmId }
impl MutationInterval {
	fn is_older_than(&self, test: TestId) -> bool { test > self.stop }
	fn contains(&self, test: TestId) -> bool { test >= self.start && test <= self.stop }
	fn get_mutation_info(&self, test: TestId) -> Option<MutationInfo> {
		if self.contains(test) {
			let mutation_id = MutationId::from_integer_interval(self.start.0, test.0);
			Some(MutationInfo{ mutation_id, mutation_algo: self.algo })
		} else { None }
	}
}

struct TestHistory {
	mutation_log: VecDeque<MutationInterval>,
	active_algo: Option<MutationAlgorithmId>,
	last_mutation: MutationId,
	mutation_algo_start: TestId,
	test_id: TestId,
}
impl TestHistory {
	fn new() -> Self {
		TestHistory { mutation_log: VecDeque::new(), active_algo: None,
		              last_mutation: MutationId::default(),
		              mutation_algo_start: TestId::default(),
		              test_id: TestId::default() }
	}
	fn new_test(&mut self, info: &MutationInfo) -> TestId {
		if self.active_algo == Some(info.mutation_algo) {
			assert!(self.last_mutation.is_predecessor(&info.mutation_id),
				"tests must be consecutive mutations");
		} else {
			// remember previous mutation if it existed
			if let Some(algo) = self.active_algo {
				let start = self.mutation_algo_start;
				let stop = self.test_id;
				self.mutation_log.push_back(MutationInterval { start, stop, algo });
			}
			// store new algo and reset mutation count
			self.active_algo = Some(info.mutation_algo);
			assert_eq!(info.mutation_id, MutationId::default(),
			"we expect new algorithms to start at the default id!");
			self.mutation_algo_start = self.test_id.next();
		}
		self.last_mutation = info.mutation_id;
		self.test_id = self.test_id.next();
		self.test_id
	}
	fn get_info(&mut self, id: TestId) -> MutationInfo {
		while self.mutation_log.len() > 0 {
			let oldest = self.mutation_log.front().unwrap().clone();
			if let Some(info) = oldest.get_mutation_info(id) {
				return info;
			} else {
				assert!(oldest.is_older_than(id), "we lost information, probably out of order test!");
				self.mutation_log.pop_front();
			}
		}
		assert!(id <= self.test_id, "cannot handle tests from the future!");
		let mutation_id = MutationId::from_integer_interval(self.mutation_algo_start.0, id.0);
		MutationInfo{ mutation_id, mutation_algo: self.active_algo.unwrap() }
	}
}

#[derive(Clone)]
pub struct BufferedFuzzServerConfig {
	pub test_size : TestSize,
	pub test_buffer_size : usize,
	pub coverage_buffer_size : usize,
	// TODO: make sure that coverage buffer is large enough
	pub buffer_count : usize,
}

struct Buffers {
	test: TestBuffer,
	coverage: CoverageBuffer,
}
impl Buffers {
	fn finalize(&mut self) -> (u32, u32) {
		(self.test.finalize() as u32,
		 self.coverage.finalize() as u32)
	}
	fn reactivate(self, test_id: i32, cov_id: i32) -> Self {
		let test = self.test.reactivate(test_id).expect("test id did not match");
		let coverage = self.coverage.reactivate(cov_id).expect("coverage id did not match");
		Buffers { test, coverage }
	}
	fn reset(mut self) -> Self { self.test.reset(); self }
	fn is_id(&self, test_id: i32, cov_id: i32) -> bool {
		self.test.is_id(test_id) && self.coverage.is_id(cov_id)
	}
}

pub struct BufferedFuzzServer {
	name: String,
	conf: BufferedFuzzServerConfig,
	com: MetaChannel,
	history: TestHistory,
	active_in: Buffers,
	active_out: VecDeque<Buffers>,
	free: Vec<Buffers>,
	used: Vec<Buffers>
}

impl BufferedFuzzServer {
	pub fn connect(dir: &path::Path, conf: &BufferedFuzzServerConfig) -> Option<Self> {
		assert!(conf.buffer_count >= 1);
		let name = dir.file_name().unwrap().to_os_string().into_string().unwrap();
		if let Some(com) = MetaChannel::connect(dir) {
			let history = TestHistory::new();
			let active_in = BufferedFuzzServer::make_buffer(&conf);
			let active_out = VecDeque::with_capacity(conf.buffer_count);
			let used = Vec::new();
			let mut free = Vec::new();
			for _ in 1..conf.buffer_count {
				free.push(BufferedFuzzServer::make_buffer(&conf));
			}
			let conf = (*conf).clone();
			Some(BufferedFuzzServer { name, conf, com, history, active_in, active_out, free, used })
		} else { None }
	}

	fn make_buffer(conf: &BufferedFuzzServerConfig) -> Buffers {
		let test = TestBuffer::create(conf.test_size, conf.test_buffer_size);
		let coverage = CoverageBuffer::create(conf.test_size, conf.coverage_buffer_size);
		Buffers { test, coverage }
	}

	/// returns a buffer from the `free` list or a new buffer if the `free`
	/// list is empty
	fn get_new_buffer(&mut self) -> Buffers {
		if let Some(buf) = self.free.pop() { buf }
		else { BufferedFuzzServer::make_buffer(&self.conf) }
	}

	/// moves the active buffer into the `used` list, sends the buffer ids,
	/// to the fuzz server and installs a new `active_in` buffer
	fn send_active_buffers(&mut self) {
		let mut buffers = self.get_new_buffer();
		mem::swap(&mut buffers, &mut self.active_in);
		let (test_id, cov_id) = buffers.finalize();
		self.com.send_ids(test_id, cov_id);
		self.used.push(buffers);
	}

	/// removes the received buffer from the `used` list and appends it to
	/// the `active_out` queue
	fn handle_received_buffers(&mut self, cov_id: i32, test_id: i32) {
		let pos = self.used.iter().position(|ref bufs| bufs.is_id(test_id, cov_id)
			).expect("failed to find buffer ids received from fuzz server");
		let buf = self.used.swap_remove(pos).reactivate(test_id, cov_id);
		self.active_out.push_back(buf);
	}

	fn try_receive_buffers(&mut self) -> Result<(), ()> {
		if let Some((cov_id, test_id)) = self.com.try_recv_ids() {
			self.handle_received_buffers(cov_id as i32, test_id as i32);
			Ok(())
		} else { Err(()) }
	}

	fn receive_buffers(&mut self) {
		let (cov_id, test_id) = self.com.recv_ids();
		self.handle_received_buffers(cov_id as i32, test_id as i32);
	}

	/// releases the oldest buffer in `active_out`
	fn free_oldest_out(&mut self) {
		if let Some(oldest) = self.active_out.pop_front() {
			self.free.push(oldest.reset());
		}
	}

	/// policy that determines when we should block the program to wait
	/// for the fuzz server to return our buffers
	fn wait_for_buffers(&self) -> bool {
		self.used.len() >= self.conf.buffer_count
	}

	/// tries to pop coverage without receiving new buffers from the
	/// fuzz server
	fn pop_available_coverage(&mut self) -> Option<BasicFeedback> {
		while self.active_out.len() > 0 {
			if let Some(oldest) = self.active_out.front_mut() {
				if let Some((id, data)) = oldest.coverage.get_coverage() {
					return Some(BasicFeedback { id, data: data.to_vec() } );
				} else {
					self.free_oldest_out();
				}
			}
		}
		None
	}
}

impl FuzzServer for BufferedFuzzServer {
	fn push_test(&mut self, info: &MutationInfo, input : &[u8]) {
		let test_id = self.history.new_test(info);
		if self.active_in.test.add_test(test_id, input).is_err() {
			// send full buffer to fuzz server and replace it with an empty one
			self.send_active_buffers();
			self.active_in.test.add_test(test_id, input).unwrap();
		}
	}

	fn pop_coverage(&mut self) -> Option<BasicFeedback> {
		match self.pop_available_coverage() {
			Some(feedback) => Some(feedback),
			None => {
				if self.wait_for_buffers() { self.receive_buffers(); }
				while self.try_receive_buffers().is_ok() {}
				self.pop_available_coverage()
			}
		}
	}

	fn get_info(&mut self, test: TestId) -> (MutationInfo, &[u8]) {
		let info = self.history.get_info(test);
		let oldest = self.active_out.front_mut().expect("coverage buffer needs to be available when get_test_info is called!");
		let input = oldest.test.find_test(test).expect("test must be available in oldest coverage buffer");
		(info, input)
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

pub fn find_one_fuzz_server(server_dir: &str, conf: BufferedFuzzServerConfig) -> Option<BufferedFuzzServer> {
	let paths = fs::read_dir(server_dir).expect("failed to open fuzz server directory!");
	for entry in paths.filter_map(|path| path.ok().and_then(|p| Some(p.path()))) {
		if entry.is_dir() {
			if let Some(server) = BufferedFuzzServer::connect(&entry, &conf) {
				return Some(server);
			}
		}
	}
	None
}

