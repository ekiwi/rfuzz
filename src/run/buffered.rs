extern crate libc;

use std;
use std::io::{Read, Write, Seek};
use std::mem;
use super::shmem::{ SharedMemoryChannel };
use super::{ TestId, BasicFeedback, FuzzServer, TestSize };
use super::super::mutation::{ MutationInfo };
use std::collections::VecDeque;
use super::history::TestHistory;

pub trait ReadInts : std::io::Read {
	fn read_u16(&mut self) -> std::io::Result<u16> {
		let mut data: [u8; 2];
		self.read_exact(&mut data)?;
		let val = (data[1] as u16) <<  8 | (data[0] as u16) <<  0;
		Ok(val)
	}

	fn read_u32(&mut self) -> std::io::Result<u32> {
		let mut data: [u8; 4];
		self.read_exact(&mut data)?;
		let val = (data[3] as u32) << 24 | (data[2] as u32) << 16 |
		          (data[1] as u32) <<  8 | (data[0] as u32) <<  0;
		Ok(val)
	}

	fn read_u64(&mut self) -> std::io::Result<u64> {
		let mut data: [u8; 8];
		self.read_exact(&mut data)?;
		let val = (data[7] as u64) << 56 | (data[6] as u64) << 48 |
		          (data[5] as u64) << 40 | (data[4] as u64) << 32 |
		          (data[3] as u64) << 24 | (data[2] as u64) << 16 |
		          (data[1] as u64) <<  8 | (data[0] as u64) <<  0;
		Ok(val)
	}
}

pub trait WriteInts : std::io::Write {
	fn write_u16(&mut self, val: u16) -> std::io::Result<()> {
		let data = [(val >>  0) as u8, (val >>  8) as u8];
		self.write_all(&data)
	}

	fn write_u32(&mut self, val: u32) -> std::io::Result<()> {
		let data = [(val >>  0) as u8, (val >>  8) as u8,
		            (val >> 16) as u8, (val >> 24) as u8];
		self.write_all(&data)
	}

	fn write_u64(&mut self, val: u64) -> std::io::Result<()> {
		let data = [(val >>  0) as u8, (val >>  8) as u8,
		            (val >> 16) as u8, (val >> 24) as u8,
		            (val >> 32) as u8, (val >> 40) as u8,
		            (val >> 48) as u8, (val >> 56) as u8];
		self.write_all(&data)
	}
}

pub trait CommunicationBuffer : ReadInts + WriteInts + std::io::Seek {
	// TODO: should this be in a separate trait?
	fn len(&self) -> usize;
	fn get_ref<'a, 'b: 'a>(&'b mut self, len: usize) -> std::io::Result<(&'a [u8])>;
}

pub trait CommunicationChannel {
	type BufferT : CommunicationBuffer;
	type TokenT: Clone + Copy + PartialEq;
	fn get_token(tx: &Self::BufferT, rx: &Self::BufferT) -> Self::TokenT;
	fn alloc(&mut self, size: usize) -> Self::BufferT;
	fn try_send(&mut self, token: Self::TokenT) -> Result<(), ()>;
	/// blocking send
	fn send(&mut self, token: Self::TokenT);
	fn try_receive(&mut self) -> Option<Self::TokenT>;
	/// blocking receive, will panic if nothing was sent
	fn receive(&mut self) -> Self::TokenT;
}

#[derive(Copy,Clone,Debug,PartialEq,PartialOrd,Default)]
pub struct BufferSlot { pub id: u32, pub offset: u16 }
impl BufferSlot {
	fn first(id: u32) -> Self{
		BufferSlot{id: id, offset: 0 }
	}
	fn next(&self) -> Self {
		BufferSlot{id: self.id, offset: self.offset + 1 }
	}
}

struct TestBuffer <ChannelT : CommunicationChannel> {
	size: TestSize,
	inputs : ChannelT::BufferT,
	coverage: ChannelT::BufferT,
	token: ChannelT::TokenT,
	test_count: u16,
	max_test_count: u16,
	cycle_count: u16,
	id: u32,
}

const MAGIC_HEADER: u32 = 0x19931993;
const MAGIC_COV_HEADER: u32 = 0x73537353;
const TEST_HEADER_SIZE : usize = 8 * 2;
const COVERAGE_HEADER_SIZE : usize = 8;
const COVERAGE_BUFFER_METADATA_SIZE : usize = 8 * 2;
impl <ChannelT : CommunicationChannel> TestBuffer<ChannelT> {
	fn alloc(channel: &mut ChannelT, size: TestSize,
	         input_buffer_size: usize,
	         coverage_buffer_size: usize) -> Self {
		let inputs = channel.alloc(input_buffer_size);
		let coverage = channel.alloc(coverage_buffer_size);
		let token = ChannelT::get_token(&inputs, &coverage);
		TestBuffer { size, inputs, coverage, token,
		             test_count: 0, max_test_count: 0, cycle_count: 0, id: 0 }
	}
	fn reset(&mut self, cycle_count: u16, id: u32) -> u16 {
		let test_size = self.size.input as usize * cycle_count as usize;
		let coverage_size = self.size.coverage as usize;
		let input_buf_size = self.inputs.len() - TEST_HEADER_SIZE;
		let max_inputs = input_buf_size / test_size;
		let cov_buf_size = self.coverage.len() - COVERAGE_BUFFER_METADATA_SIZE;
		let max_outputs = cov_buf_size / coverage_size;
		self.max_test_count = std::cmp::min(max_inputs, max_outputs) as u16;
		self.cycle_count = cycle_count;
		self.test_count = 0;
		self.id = id;
		// skip input buffer header for now
		self.inputs.seek(std::io::SeekFrom::Start(TEST_HEADER_SIZE as u64));
		self.max_test_count
	}
	fn add_test(&mut self, inputs: &[u8]) -> Option<BufferSlot> {
		if self.test_count + 1 > self.max_test_count { None } else {
			self.inputs.write_all(inputs).unwrap();
			let slot = BufferSlot { id: self.id, offset: self.test_count };
			self.test_count += 1;
			Some(slot)
		}
	}
	fn write_header(&mut self) {
		self.inputs.seek(std::io::SeekFrom::Start(0));
		self.inputs.write_u32(MAGIC_HEADER).unwrap();
		self.inputs.write_u32(self.id).unwrap();
		self.inputs.write_u16(self.test_count).unwrap();
		self.inputs.write_u16(self.cycle_count).unwrap();
		let reserved = 0u32;
		self.inputs.write_u32(reserved).unwrap();
	}
	fn try_run(&mut self, channel: &mut ChannelT) -> Result<(), ()> {
		channel.try_send(self.token)
	}
	fn is(&self, token: ChannelT::TokenT) -> bool{
		self.token == token
	}
	fn check_headers(&mut self) {
		// inputs
		self.inputs.seek(std::io::SeekFrom::Start(0));
		assert_eq!(self.inputs.read_u32().unwrap(), MAGIC_HEADER);
		assert_eq!(self.inputs.read_u32().unwrap(), self.id);
		assert_eq!(self.inputs.read_u16().unwrap(), self.test_count);
		assert_eq!(self.inputs.read_u16().unwrap(), self.cycle_count);
		assert_eq!(self.inputs.read_u32().unwrap(), 0);
		// coverage
		self.coverage.seek(std::io::SeekFrom::Start(0));
		let magic = self.coverage.read_u32().unwrap();
		assert_eq!(magic, MAGIC_COV_HEADER);
		let buffer_id = self.coverage.read_u32().unwrap();
		assert_eq!(buffer_id, self.id);
		self.coverage.seek(std::io::SeekFrom::End(-8));
		let _status = self.coverage.read_u64().unwrap();
		// TODO: use status
	}
	fn get_coverage(&mut self, slot: BufferSlot) -> Option<&[u8]> {
		if self.contains(slot) {
			let pos = slot.offset as usize * self.size.coverage as usize + COVERAGE_HEADER_SIZE;
			self.coverage.seek(std::io::SeekFrom::Start(pos as u64));
			Some(self.coverage.get_ref(self.size.coverage).unwrap())
		} else { None }
	}
	fn get_test(&mut self, slot: BufferSlot) -> &[u8] {
		assert_eq!(self.id, slot.id);
		assert!(self.max_test_count >= slot.offset);
		let test_size = self.size.input as usize * self.cycle_count as usize;
		let pos = slot.offset as usize * test_size + TEST_HEADER_SIZE;
		self.inputs.seek(std::io::SeekFrom::Start(pos as u64));
		self.inputs.get_ref(self.size.coverage).unwrap()
	}
	fn contains(&self, slot: BufferSlot) -> bool {
		assert_eq!(self.id, slot.id, "contains called with slot for different buffer!");
		self.id == slot.id && slot.offset <= self.max_test_count
	}
	fn first(&self) -> BufferSlot { BufferSlot { id: self.id, offset: 0 } }
}

#[derive(Clone)]
pub struct BufferedFuzzServerConfig {
	pub test_size : TestSize,
	pub test_buffer_size : usize,
	pub coverage_buffer_size : usize,
	pub buffer_count : usize,
}

pub struct BufferedFuzzServer <ChannelT : CommunicationChannel> {
	conf: BufferedFuzzServerConfig,
	com: ChannelT,
	history: TestHistory,
	active_in: TestBuffer<ChannelT>,
	next_coverage_slot: BufferSlot,
	active_out: VecDeque<TestBuffer<ChannelT>>,
	free: Vec<TestBuffer<ChannelT>>,
	used: Vec<TestBuffer<ChannelT>>,
	send: VecDeque<TestBuffer<ChannelT>>
}

impl <ChannelT : CommunicationChannel> BufferedFuzzServer<ChannelT> {
	pub fn connect(com: ChannelT, conf: BufferedFuzzServerConfig) -> Self {
		assert!(conf.buffer_count >= 1);
		let history = TestHistory::new();
		let active_in = BufferedFuzzServer::make_buffer(&mut com, &conf);
		let next_coverage_slot = BufferSlot { id: 0, offset: 0 };
		let active_out = VecDeque::with_capacity(conf.buffer_count);
		let used = Vec::new();
		let mut free = Vec::new();
		let send = VecDeque::with_capacity(conf.buffer_count);
		for _ in 1..conf.buffer_count {
			free.push(BufferedFuzzServer::make_buffer(&mut com, &conf));
		}
		BufferedFuzzServer { conf, com, history, active_in, next_coverage_slot, active_out, free, used, send }
	}

	fn make_buffer(com: &mut ChannelT, conf: &BufferedFuzzServerConfig) -> TestBuffer<ChannelT> {
		TestBuffer::<ChannelT>::alloc(com, conf.test_size, conf.test_buffer_size, conf.coverage_buffer_size)
	}

	/// returns a buffer from the `free` list or a new buffer if the `free`
	/// list is empty
	fn get_new_buffer(&mut self) -> TestBuffer<ChannelT> {
		if let Some(buf) = self.free.pop() { buf }
		else { BufferedFuzzServer::make_buffer(&mut self.com, &self.conf) }
	}

	/// moves the active buffer into the `used` list, sends the buffer ids,
	/// to the fuzz server and installs a new `active_in` buffer
	fn send_active_buffers(&mut self) {
		let mut buffers = self.get_new_buffer();
		mem::swap(&mut buffers, &mut self.active_in);
		// `buffers` now contains the previous active buffer
		buffers.write_header();
		if self.send.is_empty() && buffers.try_run(&mut self.com).is_ok() {
			self.used.push(buffers);
		} else {
			self.send.push_back(buffers);
		}
	}

	fn try_send_buffers(&mut self) {
		if let Some(buffers) = self.send.pop_front() {
			if buffers.try_run(&mut self.com).is_err() {
				self.send.push_front(buffers);
			}
		}
	}

	/// removes the received buffer from the `used` list and appends it to
	/// the `active_out` queue
	fn handle_received_buffers(&mut self, token: ChannelT::TokenT) {
		let pos = self.used.iter().position(|ref bufs| bufs.is(token)
			).expect("failed to find buffer ids received from fuzz server");
		let buf = self.used.swap_remove(pos);
		buf.check_headers();
		if self.active_out.is_empty() {
			self.next_coverage_slot = buf.first();
		}
		self.active_out.push_back(buf);
	}

	fn try_receive_buffers(&mut self) -> Result<(), ()> {
		if let Some(token) = self.com.try_receive() {
			self.handle_received_buffers(token);
			Ok(())
		} else { Err(()) }
	}

	fn receive_buffers(&mut self) {
		let token = self.com.receive();
		self.handle_received_buffers(token);
	}

	/// releases the oldest buffer in `active_out`
	fn free_oldest_out(&mut self) {
		if let Some(oldest) = self.active_out.pop_front() {
			self.free.push(oldest);
		}
		if let Some(new_oldest) = self.active_out.front(){
			self.next_coverage_slot = new_oldest.first();
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
				if let Some(data) = oldest.get_coverage(self.next_coverage_slot) {
					let id = self.history.get_id_for_slot(self.next_coverage_slot);
					self.next_coverage_slot = self.next_coverage_slot.next();
					return Some(BasicFeedback { id, data: data.to_vec() } );
				}
			}
			self.free_oldest_out();
		}
		None
	}
}

impl <ChannelT : CommunicationChannel> FuzzServer for BufferedFuzzServer<ChannelT> {
	fn push_test(&mut self, info: &MutationInfo, input : &[u8]) {
		let slot =
			if let Some(slot) = self.active_in.add_test(input) {
				slot
			} else {
				// send full buffer to fuzz server and replace it with an empty one
				self.send_active_buffers();
				self.active_in.add_test(input).unwrap()
			};
		self.history.new_test(info, &slot);
	}

	fn pop_coverage(&mut self) -> Option<BasicFeedback> {
		let feedback = self.pop_available_coverage();
		if feedback.is_some() { feedback } else {
			if self.wait_for_buffers() {
				// wait for all but one buffer (TODO: is there a better policy?)
				while self.used.len() > 1 {
					// TODO: send!
					self.receive_buffers();
				}
			}
			while self.try_receive_buffers().is_ok() {}
			self.pop_available_coverage()
		}
	}

	fn get_info(&mut self, test: TestId) -> (MutationInfo, &[u8]) {
		let info = self.history.get_mutation_info(test);
		let slot = self.history.get_buffer_slot(test);
		let oldest = self.active_out.front_mut().expect("coverage buffer needs to be available when get_test_info is called!");
		let input = oldest.get_test(slot);
		(info, input)
	}

	fn sync(&mut self) {
		// TODO: deal with blocking send
		self.send_active_buffers();
		while self.used.len() > 0 { self.receive_buffers(); }
	}
}

pub fn list_potential_fuzz_servers(server_dir: &str) {
	let paths = std::fs::read_dir(server_dir).expect("failed to open fuzz server directory!");
	for entry in paths.filter_map(|path| path.ok().and_then(|p| Some(p.path()))) {
		if entry.is_dir() {
			let name = entry.file_name().unwrap().to_os_string().into_string().unwrap();
			println!("found fuzz server: {}", name);
		}
	}
}

pub fn find_one_fuzz_server(server_dir: &str, conf: BufferedFuzzServerConfig) -> Option<BufferedFuzzServer<SharedMemoryChannel>> {
	let paths = std::fs::read_dir(server_dir).expect("failed to open fuzz server directory!");
	for entry in paths.filter_map(|path| path.ok().and_then(|p| Some(p.path()))) {
		if entry.is_dir() {
			if let Some(channel) = SharedMemoryChannel::connect(&entry) {
				return Some(BufferedFuzzServer::connect(channel, conf))
			}
		}
	}
	None
}

