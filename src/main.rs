extern crate libc;
extern crate time;

mod run;
mod mutation;
mod analysis;

use std::env;
use std::fs::File;
use std::io::prelude::*;
use run::{TestRunner};
use run::afl::{AflConfig, AflRunner};
use mutation::{MUTATIONS};
use analysis::{Analysis};

// from `afl/config.h`
pub const MAP_SIZE: usize = 1 << 16;
pub const MEM_LIMIT: usize = 25 << 20;  // 25MB

fn load_input(filename: &str) -> Vec<u8> {
	let mut f = File::open(filename).expect("file not found");
	let mut res = Vec::new();
	f.read_to_end(&mut res).expect("failed to read input file");
	res
}

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
	let mut analysis = Analysis::new();
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
}
