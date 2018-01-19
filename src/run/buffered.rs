extern crate libc;

use std;
use std::io::{Write, Seek};
use std::mem;
use super::{ TestId, BasicFeedback, FuzzServer, TestSize };
use super::super::mutation::{ MutationInfo, Mutator };
use super::rwint::{ReadIntsBigEndian, WriteIntsBigEndian};
use std::collections::VecDeque;
use super::history::TestHistory;
#[cfg(not(target_arch = "arm"))]
use super::shmem::SharedMemoryChannel;
#[cfg(target_arch = "arm")]
use super::pynqchannel::DmaChannel;
#[cfg(target_arch = "arm")]
use super::pynq;



pub trait CommunicationBuffer : ReadIntsBigEndian + WriteIntsBigEndian + std::io::Seek {
	// TODO: should this be in a separate trait?
	fn len(&self) -> usize;
	fn get_ref<'a, 'b: 'a>(&'b mut self, len: usize) -> std::io::Result<(&'a [u8])>;
}

pub trait CommunicationChannel {
	type BufferT : CommunicationBuffer;
	type TokenT: Clone + Copy + PartialEq;
	fn get_token(tx: &Self::BufferT, rx: &Self::BufferT) -> Self::TokenT;
	fn alloc(&mut self, size: usize) -> Self::BufferT;
	fn try_send(&mut self, token: Self::TokenT, tx_bytes: usize, rx_bytes: usize) -> Result<(), ()>;
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
	fn reset(&mut self, id: u32) {
		self.max_test_count = 0;
		self.cycle_count = 0;
		self.test_count = 0;
		self.id = id;
	}
	fn initialize(&mut self, cycle_count: u16) -> u16 {
		let test_size = self.size.input as usize * cycle_count as usize;
		let coverage_size = self.size.coverage as usize;
		let input_buf_size = self.inputs.len() - TEST_HEADER_SIZE;
		let max_inputs = input_buf_size / test_size;
		let cov_buf_size = self.coverage.len() - COVERAGE_BUFFER_METADATA_SIZE;
		let max_outputs = cov_buf_size / coverage_size;
		self.max_test_count = std::cmp::min(max_inputs, max_outputs) as u16;
		self.cycle_count = cycle_count;
		self.test_count = 0;
		// skip input buffer header for now
		self.inputs.seek(std::io::SeekFrom::Start(TEST_HEADER_SIZE as u64)).unwrap();
		self.max_test_count
	}
	fn add_test(&mut self, inputs: &[u8]) -> Option<BufferSlot> {
		if self.cycle_count == 0 {
			let cycle_count = inputs.len() / self.size.input as usize;
			// TODO: move this code to the caller
			self.initialize(cycle_count as u16);
		}
		if self.test_count + 1 > self.max_test_count { None } else {
			self.inputs.write_all(inputs).unwrap();
			let slot = BufferSlot { id: self.id, offset: self.test_count };
			self.test_count += 1;
			Some(slot)
		}
	}
	fn write_header(&mut self) {
		self.inputs.seek(std::io::SeekFrom::Start(0)).unwrap();
		self.inputs.write_u32(MAGIC_HEADER).unwrap();
		self.inputs.write_u32(self.id).unwrap();
		self.inputs.write_u16(self.test_count).unwrap();
		self.inputs.write_u16(self.cycle_count).unwrap();
		let reserved = 0u32;
		self.inputs.write_u32(reserved).unwrap();
	}
	fn try_run(&mut self, channel: &mut ChannelT) -> Result<(), ()> {
		let test_count = self.test_count as usize;
		let test_size = self.size.input * self.cycle_count as usize;
		let tx_bytes = test_count * test_size + TEST_HEADER_SIZE;
		let rx_bytes = test_count * self.size.coverage + COVERAGE_BUFFER_METADATA_SIZE;
		channel.try_send(self.token, tx_bytes, rx_bytes)
	}
	fn is(&self, token: ChannelT::TokenT) -> bool{
		self.token == token
	}
	fn check_headers(&mut self) {
		// inputs
		self.inputs.seek(std::io::SeekFrom::Start(0)).unwrap();
		assert_eq!(self.inputs.read_u32().unwrap(), MAGIC_HEADER);
		assert_eq!(self.inputs.read_u32().unwrap(), self.id);
		assert_eq!(self.inputs.read_u16().unwrap(), self.test_count);
		assert_eq!(self.inputs.read_u16().unwrap(), self.cycle_count);
		assert_eq!(self.inputs.read_u32().unwrap(), 0);
		// coverage
		self.coverage.seek(std::io::SeekFrom::Start(0)).unwrap();
		let magic = self.coverage.read_u32().unwrap();
		assert_eq!(magic, MAGIC_COV_HEADER);
		let buffer_id = self.coverage.read_u32().unwrap();
		assert_eq!(buffer_id, self.id);
		self.coverage.seek(std::io::SeekFrom::End(-8)).unwrap();
		let _status = self.coverage.read_u64().unwrap();
		// TODO: use status
	}
	fn get_coverage(&mut self, slot: BufferSlot) -> Option<&[u8]> {
		if self.contains(slot) {
			let pos = slot.offset as usize * self.size.coverage as usize + COVERAGE_HEADER_SIZE;
			self.coverage.seek(std::io::SeekFrom::Start(pos as u64)).unwrap();
			Some(self.coverage.get_ref(self.size.coverage).unwrap())
		} else { None }
	}
	fn get_test(&mut self, slot: BufferSlot) -> &[u8] {
		assert_eq!(self.id, slot.id);
		assert!(self.max_test_count >= slot.offset);
		let test_size = self.size.input as usize * self.cycle_count as usize;
		let pos = slot.offset as usize * test_size + TEST_HEADER_SIZE;
		self.inputs.seek(std::io::SeekFrom::Start(pos as u64)).unwrap();
		self.inputs.get_ref(test_size).unwrap()
	}
	fn contains(&self, slot: BufferSlot) -> bool {
		assert_eq!(self.id, slot.id, "contains called with slot for different buffer!");
		self.id == slot.id && slot.offset < self.test_count
	}
	fn first(&self) -> BufferSlot { BufferSlot::first(self.id) }
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
	send: VecDeque<TestBuffer<ChannelT>>,
	next_buffer_id: u32
}

impl <ChannelT : CommunicationChannel> BufferedFuzzServer<ChannelT> {
	pub fn connect(mut com: ChannelT, conf: BufferedFuzzServerConfig) -> Self {
		assert!(conf.buffer_count >= 1);
		let history = TestHistory::new();
		let mut active_in = BufferedFuzzServer::make_buffer(&mut com, &conf);
		let next_coverage_slot = BufferSlot { id: 0, offset: 0 };
		let active_out = VecDeque::with_capacity(conf.buffer_count);
		let used = Vec::new();
		let mut free = Vec::new();
		let send = VecDeque::with_capacity(conf.buffer_count);
		for _ in 1..conf.buffer_count {
			free.push(BufferedFuzzServer::make_buffer(&mut com, &conf));
		}
		// first buffer gets id 0
		active_in.reset(0);
		let next_buffer_id = 1;
		BufferedFuzzServer { conf, com, history, active_in, next_coverage_slot,
		                     active_out, free, used, send, next_buffer_id }
	}

	fn make_buffer(com: &mut ChannelT, conf: &BufferedFuzzServerConfig) -> TestBuffer<ChannelT> {
		TestBuffer::<ChannelT>::alloc(com, conf.test_size, conf.test_buffer_size, conf.coverage_buffer_size)
	}

	/// returns a buffer from the `free` list or a new buffer if the `free`
	/// list is empty
	fn get_new_buffer(&mut self) -> TestBuffer<ChannelT> {
		let mut buf =
			if let Some(buf) = self.free.pop() { buf }
			else { BufferedFuzzServer::make_buffer(&mut self.com, &self.conf) };
		buf.reset(self.next_buffer_id);
		self.next_buffer_id += 1;
		buf
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
			self.try_send_buffers();
			self.send.push_back(buffers);
		}
	}

	fn try_send_buffers(&mut self) {
		if let Some(mut buffers) = self.send.pop_front() {
			if buffers.try_run(&mut self.com).is_err() {
				self.send.push_front(buffers);
			} else {
				self.used.push(buffers);
			}
		}
	}

	/// removes the received buffer from the `used` list and appends it to
	/// the `active_out` queue
	fn handle_received_buffers(&mut self, token: ChannelT::TokenT) {
		let pos = self.used.iter().position(|ref bufs| bufs.is(token)
			).expect("failed to find buffer ids received from fuzz server");
		let mut buf = self.used.swap_remove(pos);
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
	fn should_wait_for_buffers(&self) -> bool {
		(self.used.len() + self.send.len()) >= self.conf.buffer_count
	}

	fn wait_for_buffers(&mut self) {
		if self.should_wait_for_buffers() {
			// wait for all but one buffer (TODO: is there a better policy?)
			while self.used.len() > 1 || self.send.len() > 1 {
				self.try_send_buffers();
				self.receive_buffers();
			}
		}
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

	fn push_test(&mut self, info: &MutationInfo, input : &[u8]) {
		let slot =
			if let Some(slot) = self.active_in.add_test(input) {
				slot
			} else {
				// send full buffer to fuzz server and replace it with an empty one
				self.send_active_buffers();
				// potentially block if we are running out of buffers
				self.wait_for_buffers();
				self.active_in.add_test(input).unwrap()
			};
		let _id = self.history.new_test(info, &slot);
		// println!("{:?} -> {:?}", slot, _id);
	}
}

impl <ChannelT : CommunicationChannel> FuzzServer for BufferedFuzzServer<ChannelT> {
	/// shedule test input for execution
	fn run(&mut self, mutator: &Mutator) {
		let mutator_id = mutator.id();
		let max = mutator.max();
		// output of the mutator aka input to our fuzz server
		let mut output = vec![0u8; mutator.output_size()];
		for ii in 0..max {
			mutator.apply(ii, &mut output);
			// TODO: inline push test, we could save a copy here!
			self.push_test(&MutationInfo { mutator: mutator_id, ii }, &output);
		}
	}

	fn pop_coverage(&mut self) -> Option<BasicFeedback> {
		let feedback = self.pop_available_coverage();
		if feedback.is_some() { feedback } else {
			// potentially block if we are running out of buffers
			self.wait_for_buffers();
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
		while self.used.len() > 0 || self.send.len() > 0 {
			self.try_send_buffers();
			self.receive_buffers();
		}
	}
}

#[cfg(not(target_arch = "arm"))]
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

#[cfg(target_arch = "arm")]
pub fn find_one_fuzz_server(_: &str, conf: BufferedFuzzServerConfig) -> Option<BufferedFuzzServer<DmaChannel>> {
	// TODO: move somewhere else
	pynq::load_bitstream("system.bit", &[pynq::Clock{ div0: 5, div1: 2 }]).unwrap();
	let channel = DmaChannel::connect();
	Some(BufferedFuzzServer::connect(channel, conf))
}

