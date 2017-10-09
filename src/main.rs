extern crate libc;
extern crate time;

mod run;
mod mutation;
mod analysis;

use std::env;
use std::fs;
use std::path;
use std::io;
use std::io::prelude::*;


#[cfg(not(FUZZ_AFL))]
const FPGA_DIR: &'static str = "/tmp/fpga";
#[cfg(not(FUZZ_AFL))]
const MAGIC_HEADER: u32 = 0x19933991;

#[cfg(not(FUZZ_AFL))]
use run::shmem::SharedMemory;
use analysis::{Analysis};
use mutation::{MUTATIONS};


#[derive(Copy, Clone)]
struct TestSize {
	coverage: usize,
	input: usize,
}

impl TestSize {
	fn new(coverage_size: usize, input_size: usize) -> Self {
		assert_eq!(coverage_size % 4, 0);
		assert_eq!(input_size % 4, 0);
		TestSize { coverage: coverage_size, input: input_size }
	}
}

#[cfg(not(FUZZ_AFL))]
struct Buffer {	// TODO: find better name for this
	size: TestSize,
	data: SharedMemory,
	test_count: u32,
}
#[cfg(not(FUZZ_AFL))]
impl Buffer {
	fn create(size: TestSize, buffer_size: usize) -> Self {
		let test_count = 0u32;
		let mut data = SharedMemory::create(buffer_size);
		data.write_u32(MAGIC_HEADER).unwrap();
		data.write_u32(test_count).unwrap();
		Buffer { size, data, test_count }
	}

	fn reset(&mut self) {
		self.test_count = 0;
		self.data.reset_write_offset();
		self.data.write_u32(MAGIC_HEADER).unwrap();
		self.data.write_u32(self.test_count).unwrap();
	}

	fn add_test(&mut self, id: u64, inputs: &[u8]) -> Result<(), ()> {
		if inputs.len() % self.size.input != 0 { return Err(()); }
		self.data.write_u64(id)?;
		let input_count = (inputs.len() / self.size.input) as u32;
		self.data.write_u32(input_count)?;
		self.data.write_all(inputs)?;
		self.data.write_zeros(self.size.coverage)?;
		self.test_count += 1;
		Ok(())
	}

	fn finalize(&mut self) -> i32 {
		self.data.as_slice_u32_mut()[1] = self.test_count;
		self.data.id()
	}

	fn reactivate(self, id: i32) -> Option<Self> {
		if id == self.data.id() { Some(self) }
		else { None }
	}
}

const TEST_SIZE : TestSize = TestSize { coverage: 12, input: 12 };

#[cfg(not(FUZZ_AFL))]
struct FuzzServer {
	name: String,
	tx: fs::File,
	rx: fs::File,
	// this is a work around because I suck at rust....
	// this vector will only ever contain 0 or 1  buffer
	buffer: Vec<Buffer>,
}

#[cfg(not(FUZZ_AFL))]
impl FuzzServer {
	fn connect(dir: &path::Path) -> Option<Self> {
		let name = dir.file_name().unwrap().to_os_string().into_string().unwrap();

		// open pipes in the same order as the fpga mockup interface server does
		// (see hardware-afl:src/fpga_queue.cpp
		let tx_path = dir.join("tx.fifo");
		let mut tx = fs::File::open(&tx_path).expect("failed to open tx fifo!");
		println!("Sucessfully opened {} to communicate with FPGA{}",
			     tx_path.display(), name);
		// the receive pipe of the fuzz server needs to be opened write only
		// in order to fullfill the fifo interface
		let rx_path = dir.join("rx.fifo");
		let mut rx = fs::OpenOptions::new().write(true).open(&rx_path).expect("failed to open rx fifo!");
		println!("Sucessfully opened {} to communicate with FuzzServer {}",
			     tx_path.display(), name);
		Some(FuzzServer { name, tx, rx, buffer: Vec::new() })
	}

	fn push_buffer(&mut self, mut buf: Buffer) {
		let id = buf.finalize();
		// send id to the fuzz server
		self.rx.write(&[((id as u32) >>  0) as u8, ((id as u32) >>  8) as u8,
		                ((id as u32) >> 16) as u8, ((id as u32) >> 24) as u8]).unwrap();
		//println!("sent buffer({})", id);
		self.buffer.push(buf);
	}

	fn pop_buffer(&mut self) -> Option<Buffer> {
		if self.buffer.len() < 1 { return None; }
		// wait for fuzz server to return the bffer to us
		let mut rb = [0;4];
		assert_eq!(self.tx.read(&mut rb).expect("failed to read from tx pipe"), 4);
		let returned_id = (((rb[0] as u32) <<  0) | ((rb[1] as u32) <<  8) |
			               ((rb[2] as u32) << 16) | ((rb[3] as u32) << 24)) as i32;
		//println!("received buffer({})", returned_id);
		if let Some(buf) = self.buffer.pop() {
			buf.reactivate(returned_id)
		} else { None }
	}
}

fn list_potential_fuzz_servers(server_dir: &str) {
	let paths = fs::read_dir(server_dir).expect("failed to open fuzz server directory!");
	for entry in paths.filter_map(|path| path.ok().and_then(|p| Some(p.path()))) {
		if entry.is_dir() {
			let name = entry.file_name().unwrap().to_os_string().into_string().unwrap();
			println!("found fuzz server: {}", name);
		}
	}
}

fn find_one_fuzz_server(server_dir: &str) -> Option<FuzzServer> {
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

#[cfg(not(FUZZ_AFL))]
fn main() {
	list_potential_fuzz_servers(FPGA_DIR);

	// take the first fuzz server and open a connection to it
	let mut server  = find_one_fuzz_server(FPGA_DIR).expect("failed to find a fuzz server");

	// allocate a shared memory buffer that we will then push to the fuzz server
	let mut buf = Buffer::create(TEST_SIZE, 4 * 1024);

	let orig_input = vec![0u8; 12 * 3]; // 3 cycles
	let mut runs : usize = 0;
	let mut test_id : u64 = 10;
	let start = time::PreciseTime::now();
	let mut analysis = Analysis::new(TEST_SIZE.coverage);
	let mut input = orig_input.clone();

	for mutation in MUTATIONS.iter() {
		let iterator = mutation.iter(input.len());
		runs += iterator.max;
		println!("running circuit {} times with {} mutation", iterator.max, mutation.name);
		for mutator in iterator {
			mutator.run(&mut input);
			// try to add test to buffer, handle full buffer
			if buf.add_test(test_id, &input).is_err() {
				server.push_buffer(buf);
				// TODO: use second buffer
				buf = server.pop_buffer().expect("failed to get buffer back");
				// TODO: perform analysis on returned coverage
				buf.reset();
				buf.add_test(test_id, &input).expect("failed to place test in buffer");
			}
			test_id += 1;
			// reset input
			input = orig_input.clone();
		}
	}
	let duration = start.to(time::PreciseTime::now()).num_microseconds().unwrap();
	let runs_per_second = (runs * 1000 * 1000) as f64 / duration as f64;
	println!("{:.1} runs/s", runs_per_second);
	println!("Discovered {} new paths.", analysis.path_count());
	println!("Discovered {} new inputs.", analysis.new_inputs_count());
}


	// list_potential_fuzz_servers(FPGA_DIR);

	// take the first fuzz server and open a connection to it
	// let mut server  = find_one_fuzz_server(FPGA_DIR).expect("failed to find a fuzz server");

	// allocate a shared memory buffer that we will then push to the fuzz server
	// let mut buf = Buffer::create(TEST_SIZE, 4 * 1024);
	// push test to buffer
	// let test_id = 3u64;
	// let test_inputs = [0; 24];
	// buf.add_test(test_id, &test_inputs).unwrap();
	// server.push_buffer(buf);

	// let mut buf_with_coverage = server.pop_buffer().expect("failed to get buffer back");
	// buf_with_coverage.reset();
	// buf_with_coverage.add_test(test_id, &test_inputs).unwrap();
	// server.push_buffer(buf_with_coverage);

	// let mut buf_with_coverage_2 = server.pop_buffer();





#[cfg(FUZZ_AFL)]
use std::fs::File;
#[cfg(FUZZ_AFL)]
use std::io::prelude::*;
#[cfg(FUZZ_AFL)]
use run::{TestRunner};
#[cfg(FUZZ_AFL)]
use run::afl::{AflConfig, AflRunner};

// from `afl/config.h`
#[cfg(FUZZ_AFL)]
pub const MAP_SIZE: usize = 1 << 16;
#[cfg(FUZZ_AFL)]
pub const MEM_LIMIT: usize = 25 << 20;  // 25MB

#[cfg(FUZZ_AFL)]
fn load_input(filename: &str) -> Vec<u8> {
	let mut f = File::open(filename).expect("file not found");
	let mut res = Vec::new();
	f.read_to_end(&mut res).expect("failed to read input file");
	res
}

#[cfg(FUZZ_AFL)]
fn main() {
	println!("{}", env::args().nth(0).unwrap());

	// TODO: extract from command line args
	let argv = &["./put/build-zlib/minigzip", "-d"];
	// example gzip from AFL repo
	let orig_input = load_input("resources/small_archive.gz");
	println!("Input length: {}", orig_input.len());

	let cfg = AflConfig {argv : argv, map_size : MAP_SIZE, mem_limit : MEM_LIMIT};
	let runner = AflRunner::create(&cfg);
	let mut runs : usize = 0;

	let start = time::PreciseTime::now();
	let mut analysis = Analysis::new(MAP_SIZE);
	let mut input = orig_input.clone();

	for mutation in MUTATIONS.iter() {
		let iterator = mutation.iter(input.len());
		runs += iterator.max;
		println!("running {} {} times with {} mutation", argv[0], iterator.max, mutation.name);
		for mutator in iterator {
			mutator.run(&mut input);
			let fault = runner.run(&input);
			analysis.run(fault, runner.coverage().as_slice_u8());
			// reset input
			input = orig_input.clone();
		}
	}
	let duration = start.to(time::PreciseTime::now()).num_microseconds().unwrap();
	let runs_per_second = (runs * 1000 * 1000) as f64 / duration as f64;
	println!("{:.1} runs/s", runs_per_second);
	println!("Discovered {} new paths.", analysis.path_count());
	println!("Discovered {} new inputs.", analysis.new_inputs_count());
	println!("TODO: this seems like a lot of new inputs ... is there a bug?");
}
