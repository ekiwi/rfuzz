extern crate libc;
extern crate time;

mod run;
mod mutation;
mod analysis;

use std::env;
use std::fs;

const FPGA_DIR: &'static str = "/tmp/fpga";
const MAGIC_HEADER: u32 = 0x19933991;

#[cfg(not(FUZZ_AFL))]
fn main() {
	println!("{}", env::args().nth(0).unwrap());

	// try to connect to fpga interface
	let paths = fs::read_dir(FPGA_DIR).expect("failed to open fpga directory!");
	for fpga_path in paths.filter_map(|path| path.ok().and_then(|p| p.path().file_name().and_then(|name| name.to_os_string().into_string().ok()))) {
		println!("found fpga: {}", fpga_path);
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
