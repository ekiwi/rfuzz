extern crate libc;
extern crate time;
mod run;
mod mutation;

use std::env;
use std::ffi::{CString};
use run::{TestRunner};
use run::afl::{AflConfig, AflRunner};
use mutation::{BitFlip};

// from `afl/config.h`
pub const MAP_SIZE: usize = 1 << 16;
pub const MEM_LIMIT: usize = 25 << 20;  // 25MB

fn main() {
	println!("{}", env::args().nth(0).unwrap());

	// TODO: extract from command line args
	let argv = &["./put/build-zlib/minigzip", "-d"];
	let mut input = [0u8; 8];

	let cfg = AflConfig {argv : argv, map_size : MAP_SIZE, mem_limit : MEM_LIMIT};
	let runner = AflRunner::create(&cfg);

	let mutator = BitFlip::create(1, input.len());

	let runs = mutator.max;
	println!("running {} {} times simple input mutation", argv[0], runs);
	let start = time::PreciseTime::now();
	for mutation in mutator {
		mutation.run(&mut input);
		println!("{:?}", input);
		runner.run(&input);
		// reset input
		input = [0u8; 8];
	}
	let duration = start.to(time::PreciseTime::now()).num_microseconds().unwrap();
	let runs_per_second = (runs * 1000 * 1000) as f64 / duration as f64;
	println!("{:.1} runs/s", runs_per_second);
}
