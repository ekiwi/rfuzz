extern crate libc;
extern crate time;
extern crate twox_hash;
mod run;
mod mutation;

use std::env;
use std::fs::File;
use std::io::prelude::*;
use run::{TestRunner};
use run::afl::{AflConfig, AflRunner};
use mutation::{MUTATIONS};
use std::hash::Hasher;
use twox_hash::XxHash;
use std::collections::HashSet;

// from `afl/config.h`
pub const MAP_SIZE: usize = 1 << 16;
pub const MEM_LIMIT: usize = 25 << 20;  // 25MB

fn hash_xx(input: &[u8]) -> u64 {
	let mut hasher = XxHash::default();
	hasher.write(input);
	hasher.finish()
}

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
	let mut old_hashes : HashSet<u64> = HashSet::new();
	let mut input = orig_input.clone();

	for mutation in MUTATIONS.iter() {
		let iterator = mutation.iter(input.len());
		runs += iterator.max;
		println!("running {} {} times with {} mutation", argv[0], iterator.max, mutation.name);
		for mutator in iterator {
			mutator.run(&mut input);
			runner.run(&input);
			// analyze
			let new_hash = hash_xx(runner.coverage().as_slice_u8());
			if !old_hashes.contains(&new_hash) {
				// println!("Input generated new coverage: {:?}", input);
				old_hashes.insert(new_hash);
			}
			// reset input
			input = orig_input.clone();
		}
	}
	let duration = start.to(time::PreciseTime::now()).num_microseconds().unwrap();
	let runs_per_second = (runs * 1000 * 1000) as f64 / duration as f64;
	println!("{:.1} runs/s", runs_per_second);
	println!("Discovered {} new paths.", old_hashes.len());
}
