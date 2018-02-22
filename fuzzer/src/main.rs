extern crate libc;
extern crate time;
extern crate rand;
extern crate toml;
#[macro_use] extern crate serde_derive;
extern crate colored;
#[macro_use] extern crate prettytable;
extern crate ctrlc;
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::Arc;

mod config;
mod run;
mod mutation;
mod analysis;
mod queue;
use std::borrow::BorrowMut;
use run::buffered::{ find_one_fuzz_server, BufferedFuzzServerConfig };
use run::FuzzServer;

const FPGA_DIR: &'static str = "/tmp/fpga";
const WORD_SIZE : usize = 8;

#[derive(Debug)]
struct Args {
	flag_print_queue: bool,
	flag_print_total_cov: bool
}

impl Default for Args {
	fn default() -> Self {
		Args { flag_print_queue: true, flag_print_total_cov: true }
	}
}

fn main() {
	let canceled = Arc::new(AtomicBool::new(false));
	let c = canceled.clone();
	ctrlc::set_handler(move || { c.store(true, Ordering::SeqCst); })
		.expect("Error setting Ctrl-C handler");

	let s_args: Vec<_> = std::env::args().collect();
	assert!(s_args.len() >= 2, "Please specify the config TOML file!");

	// TODO: actually parse command line args, e.g. with:
	// https://github.com/docopt/docopt.rs or https://clap.rs
	let args = Args::default();

	// load test config
	let test_config_file = &s_args[1];//"../hardware-afl/ICache.toml";
	let config = config::Config::from_file(WORD_SIZE, test_config_file);
	let test_size = config.get_test_size();
	config.print_header();

	// test runner
	let srv_config = BufferedFuzzServerConfig {
		test_size : test_size,
		max_cycles : 200,
		test_buffer_size : 64 * 1024,
		coverage_buffer_size : 64 * 1024,
		buffer_count: 3,
	};

	println!("Test Buffer:     {} KiB", srv_config.test_buffer_size / 1024);
	println!("Coverage Buffer: {} KiB", srv_config.coverage_buffer_size / 1024);
	println!("Max Inputs: {}", srv_config.test_buffer_size / 16 / 3);

	let mut server = find_one_fuzz_server(FPGA_DIR, srv_config).expect("failed to find a fuzz server");

	// queue
	let start_cycles = 15;
	let starting_seed = vec![0u8; (test_size.input * start_cycles)];
	let mut q = queue::Queue::create("/home/kevin/hfuzz/kfuzz/out", &starting_seed);

	// analysis
	let mut analysis = analysis::Analysis::new(test_size);
	let seed_coverage = fuzz_one(&mut server, &starting_seed, 0);
	analysis.run(&seed_coverage);
	// TODO: support multiple seeds

	// mutation
	let mut_config = mutation::MutationScheduleConfig {
		skip_deterministic: true, skip_non_deterministic: false };
	let mutations = mutation::MutationSchedule::initialize(mut_config, test_size, config.get_inputs());

	// statistics
	let mut runs : u64 = 0;
	let start = time::PreciseTime::now();

	let max_entries = 1000;
	let max_children = 100000;
	println!("fuzzing a maximum of {} queue entries", max_entries);

	for entry_count in 0..max_entries {
		let active_test = q.get_next_test();
		let mut history = active_test.mutation_history;
		let mut new_runs : u64 = 0;
		q.print_entry_summary(active_test.id, &mutations);
		while let Some(mutator) = mutations.get_mutator(&mut history, &active_test.inputs) {
			// println!("running {} mutation", mutations.get_name(mutator.id()));
			new_runs += server.run(mutator) as u64;

			while let Some(feedback) = server.pop_coverage() {
				let is_interesting = analysis.run(&feedback.data);
				if is_interesting {
					let (info, interesting_input) = server.get_info(feedback.id);
					q.add_new_test(interesting_input, info);
					//println!("New Interesting Input: {:?}", feedback.id);
					//println!("input:  {:?}", interesting_input);
					//println!("-> cov: {:?}", feedback.data);
				}
			}

			if new_runs >= max_children { break; }
		}
		runs += new_runs;
		q.return_test(active_test.id, history);
		if canceled.load(Ordering::SeqCst) {
			println!("User interrupted fuzzing. Going to shut down....");
			break;
		}
	}

	server.sync();
	while let Some(feedback) = server.pop_coverage() {
		let is_interesting = analysis.run(&feedback.data);
		if is_interesting {
			let (info, interesting_input) = server.get_info(feedback.id);
			q.add_new_test(interesting_input, info);
		}
	}

	// final bitmap
	let bitmap = analysis.get_bitmap();

	// print inputs from queue
	if args.flag_print_queue {
		println!("\n");
		println!("Formated Inputs and Coverage!");

		let mut ii = 1u16;
		for entry in q.entries() {
			q.print_entry_summary(entry.id, &mutations);
			config.print_inputs(&entry.inputs);
			println!("Achieved Coverage:");
			let coverage = fuzz_one(&mut server, &entry.inputs, ii);
			ii += 1;
			config.print_test_coverage(&coverage);
			println!("\n");
		}
	}

	if args.flag_print_total_cov {
		println!("Total Coverage:");
		config.print_bitmap(&bitmap);
	}


	// print statistics
	let duration = start.to(time::PreciseTime::now()).num_microseconds().unwrap();
	let runs_per_second = (runs * 1000 * 1000) as f64 / duration as f64;
	println!("{:.1} runs/s ({} tests total)", runs_per_second, runs);
	println!("Discovered {} new paths.", analysis.path_count());
	println!("Discovered {} new inputs.", analysis.new_inputs_count());
	println!("Bitmap: {:?}", bitmap);

}

fn fuzz_one(server: &mut FuzzServer, input: &[u8], ii: u16) -> Vec<u8> {
	let mutator = mutation::identity(input);
	server.run(mutator);
	server.sync();
	let feedback = server.pop_coverage().expect("should get exactly one coverage back!");
	feedback.data.to_vec()
}