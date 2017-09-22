extern crate libc;
extern crate time;
mod run;
mod mutation;

use std::env;
use std::ffi::{CString};
use run::{TestRunner};
use run::afl::{AflConfig, AflRunner};


// from `afl/config.h`
pub const MAP_SIZE: usize = 1 << 16;
pub const MEM_LIMIT: usize = 25 << 20;  // 25MB

fn main() {
	println!("{}", env::args().nth(0).unwrap());

	// TODO: extract from command line args
	let argv = &["./put/build-zlib/minigzip", "-d"];
	let input = b"\x00\x00\x00\x00\x00\x00\x00\x00";
	//let input = b"\x1f\x8b\x08\xfb";

	let cfg = AflConfig {argv : argv, map_size : MAP_SIZE, mem_limit : MEM_LIMIT};
	let runner = AflRunner::create(&cfg);
	let runs = 1000 as i64;
	println!("running {} {} times with the same input...", argv[0], runs);
	let start = time::PreciseTime::now();
	for _ in 0..runs {
		runner.run(input);
	}
	let duration = start.to(time::PreciseTime::now());
	let runs_per_second = (runs * 1000 * 1000) as f64 / duration.num_microseconds().unwrap() as f64;
	println!("{:.1} runs/s", runs_per_second);
}
