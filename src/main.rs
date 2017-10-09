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


#[cfg(not(FUZZ_AFL))]
struct Buffer {	// TODO: find better name for this
	data: SharedMemory
}

impl Buffer {
	fn create(size: usize) -> Self {
		let test_count = 0u32;
		let data = SharedMemory::create(size);
		data.as_slice_u32_mut()[0] = MAGIC_HEADER;
		data.as_slice_u32_mut()[1] = test_count;
		Buffer { data }
	}

	fn shm_id(&self) -> i32 { self.data.id() }
}


#[cfg(not(FUZZ_AFL))]
fn communicate_with_fpga(dir: &path::Path) {
	let name = dir.file_name().unwrap().to_os_string().into_string().unwrap();
	println!("found fpga: {}", name);

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
	println!("Sucessfully opened {} to communicate with FPGA{}",
	         tx_path.display(), name);

	// allocate a shared memory buffer that we will then push to the fuzz server
	let mut buf = Buffer::create(4 * 1024);
	let id = buf.shm_id();
	// send id to the fuzz server
	rx.write(&[((id as u32) >>  0) as u8, ((id as u32) >>  8) as u8,
	           ((id as u32) >> 16) as u8, ((id as u32) >> 24) as u8]);
	println!("sent buffer({})", id);

	// wait for fuzz server to return the bffer to us
	let mut rb = [0;4];
	assert_eq!(tx.read(&mut rb).expect("failed to read from tx pipe"), 4);
	let returned_id = (((rb[0] as u32) <<  0) | ((rb[1] as u32) <<  8) |
	                   ((rb[2] as u32) << 16) | ((rb[3] as u32) << 24)) as i32;
	println!("received buffer({})", returned_id);

	// for now wait for user input to exit
	println!("press ENTER-key to exit...");
	let _ = io::stdin().read(&mut [0u8]).unwrap();
}


#[cfg(not(FUZZ_AFL))]
fn main() {
	println!("{}", env::args().nth(0).unwrap());

	// try to connect to fpga interface
	let paths = fs::read_dir(FPGA_DIR).expect("failed to open fpga directory!");
	for fpga_entry in paths.filter_map(|path| path.ok().and_then(|p| Some(p.path()))) {
		if fpga_entry.is_dir() {
			communicate_with_fpga(fpga_entry.as_path());
		}
	}

}








#[cfg(FUZZ_AFL)]
use std::fs::File;
#[cfg(FUZZ_AFL)]
use std::io::prelude::*;
#[cfg(FUZZ_AFL)]
use run::{TestRunner};
#[cfg(FUZZ_AFL)]
use run::afl::{AflConfig, AflRunner};
#[cfg(FUZZ_AFL)]
use mutation::{MUTATIONS};
#[cfg(FUZZ_AFL)]
use analysis::{Analysis};

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
