#![allow(dead_code)]

extern crate libc;
extern crate time;
extern crate rand;
extern crate toml;
extern crate serde_json;
#[macro_use] extern crate serde_derive;
extern crate colored;
#[macro_use] extern crate prettytable;
extern crate ctrlc;
extern crate clap;
use clap::{Arg, App};

use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::Arc;

mod config;
mod run;
mod mutation;
mod analysis;
mod queue;
mod test;
mod stats;
use run::buffered::{ find_one_fuzz_server, BufferedFuzzServerConfig };
use run::{ FuzzServer, Run };

const APP_NAME: &'static str = env!("CARGO_PKG_NAME");
const VERSION: &'static str = env!("CARGO_PKG_VERSION");
const AUTHOR: &'static str = env!("CARGO_PKG_AUTHORS");
const FPGA_DIR: &'static str = "/tmp/fpga";
const WORD_SIZE : usize = 8;

#[derive(Debug)]
struct Args {
	toml_config: String,
	print_queue: bool,
	print_total_cov: bool,
	skip_deterministic: bool,
	skip_non_deterministic: bool,
	random: bool,
	input_directory: Option<String>,
	output_directory: String,
	test_mode: bool,
}

fn main() {
	let matches = App::new(APP_NAME).version(VERSION).author(AUTHOR)
		.about("AFL-style fuzzer specialized for fuzzing RTL circuits.")
		.version_short("v")
		.arg(Arg::with_name("TOML")
			.help("TOML file describing the circuit being fuzzed")
			.required(true).index(1))
		.arg(Arg::with_name("print_queue")
			.long("print-queue").short("q")
			.help("Prints queue content at the end of a fuzzing run."))
		.arg(Arg::with_name("print_total_cov")
			.long("print-total-cov").short("c")
			.help("Prints the union coverage at the end of a fuzzing run."))
		.arg(Arg::with_name("skip_deterministic")
			.long("skip-deterministic").short("d")
			.help("Skip all deterministic mutation strategies."))
		.arg(Arg::with_name("skip_non_deterministic")
			.long("skip-non-deterministic").short("n")
			.help("Skip all non-deterministic mutation strategies."))
		.arg(Arg::with_name("random")
			.long("random").short("r")
			.help("Generate independent random inputs instead of using the fuzzing algorithm."))
		.arg(Arg::with_name("input_directory")
			.long("input-directory").short("i").value_name("DIR")
			.takes_value(true)
			.help("The output directory of a previous run from which to resume."))
		.arg(Arg::with_name("output_directory")
			.long("output-directory").short("o").value_name("DIR")
			.takes_value(true)
			.help("Used to log this session. Must be empty!")
			.required(true))
		.arg(Arg::with_name("test_mode")
			.long("test-mode").short("t")
			.help("Test the fuzz server with known input/coverage pairs."))
		.get_matches();

	let args = Args {
		toml_config: matches.value_of("TOML").unwrap().to_string(),
		print_queue: matches.is_present("print_queue"),
		print_total_cov: matches.is_present("print_total_cov"),
		skip_deterministic: matches.is_present("skip_deterministic"),
		skip_non_deterministic: matches.is_present("skip_non_deterministic"),
		random: matches.is_present("random"),
		input_directory: matches.value_of("input_directory").map(|s| s.to_string()),
		output_directory: matches.value_of("output_directory").unwrap().to_string(),
		test_mode: matches.is_present("test_mode"),
	};

	// "Ctrl + C" handling
	let canceled = Arc::new(AtomicBool::new(false));
	let c = canceled.clone();
	ctrlc::set_handler(move || { c.store(true, Ordering::SeqCst); })
		.expect("Error setting Ctrl-C handler");

	// load test config
	let config = config::Config::from_file(WORD_SIZE, &args.toml_config);
	let test_size = config.get_test_size();
	config.print_header();

	// test runner
	let srv_config = BufferedFuzzServerConfig {
		test_size : test_size,
		max_cycles : 200,
		test_buffer_size : 64 * 1024 * 16,
		coverage_buffer_size : 64 * 1024 * 16,
		buffer_count: 3,
		max_runs: 1024 * 16,
	};

	println!("Test Buffer:     {} KiB", srv_config.test_buffer_size / 1024);
	println!("Coverage Buffer: {} KiB", srv_config.coverage_buffer_size / 1024);
	println!("Max Inputs: {}", srv_config.test_buffer_size / 16 / 3);

	let mut server = find_one_fuzz_server(FPGA_DIR, srv_config).expect("failed to find a fuzz server");

	if args.test_mode {
		test_mode(&mut server);
	} else {
		fuzzer(args, canceled, config, test_size, &mut server);
	}
}

fn test_mode(server: &mut FuzzServer) {
	println!("⚠️ Test mode selected! ⚠️");
	test::test_fuzz_server(server);
}

fn fuzzer(args: Args, canceled: Arc<AtomicBool>, config: config::Config,
          test_size: run::TestSize, server: &mut FuzzServer) {
	// starting seed
	let start_cycles = 5;
	let starting_seed = vec![0u8; test_size.input * start_cycles];

	// analysis
	let ranges = config.gen_ranges();
	//println!("ranges:]\n{:?}", ranges);
	let mut analysis = analysis::Analysis::new(test_size, ranges);
	let seed_coverage = fuzz_one(server, &starting_seed);
	let seed_analysis_res = analysis.run(start_cycles as u16, &seed_coverage);
	if seed_analysis_res.is_invalid {
		println!("❌ Invalid seed!");
	}
	if !seed_analysis_res.is_interesting {
		println!("⚠️ Uninteresting seed! Might be 🐟!");
	}
	// TODO: support multiple seeds

	// mutation
	let mut_config = mutation::MutationScheduleConfig {
		skip_deterministic: args.skip_deterministic,
		skip_non_deterministic: args.skip_non_deterministic,
		independent_random: args.random,
	};
	if mut_config.independent_random {
		println!("⚠️ Mutation disabled. Generating independent random inputs! ⚠️");
	}
	let mutations = mutation::MutationSchedule::initialize(mut_config, test_size, config.get_inputs());

	// statistics
	let start_ts = get_time();
	let mut statistics = stats::Stats::new(mutations.get_names(), start_ts.clone(), analysis.get_bitmap());

	// queue
	let mut q = queue::Queue::create(
		&args.output_directory,
		&starting_seed,
		seed_analysis_res.new_cov,
		start_ts,
		config.to_json(),
		statistics.take_snapshot(),
		&seed_coverage);

	let max_entries = 1_000_000;
	let max_children = 100_000;	// TODO: better mechanism to determine length of the havoc stage
	println!("fuzzing a maximum of {} queue entries", max_entries);

	for _ in 0..max_entries {
		let active_test = q.get_next_test();
		let mut history = active_test.mutation_history;
		let mut new_runs : u64 = 0;
		q.print_entry_summary(active_test.id, &mutations);
		while let Some(mut mutator) = mutations.get_mutator(&mut history, &active_test.inputs) {
			// println!("running {} mutation", mutations.get_name(mutator.id()));
			let mut done = false;
			let mut start = 0;
			while !done {
				match server.run(&mut mutator, start) {
					Run::Done(runs, cycles) => {
						statistics.update_test_count(mutator.id().id, runs as u64, cycles);
						new_runs += runs as u64;
						done = true;
					}
					Run::Yield(ii) => { start = ii; }
				}
				while let Some(feedback) = server.pop_coverage() {
					let rr = analysis.run(feedback.cycles, &feedback.data);
					if rr.is_interesting {
						if rr.is_invalid { println!("invalid input...."); }
						let (info, interesting_input) = server.get_info(feedback.id);
						let now = get_time();
						statistics.update_new_discovery(info.mutator.id, now, analysis.get_bitmap());
						q.add_new_test(interesting_input, info, rr.new_cov, now,
						               statistics.take_snapshot(), &feedback.data);
					}
				}
			}
			if new_runs >= max_children { break; }
		}
		q.return_test(active_test.id, history);
		if canceled.load(Ordering::SeqCst) {
			println!("User interrupted fuzzing. Going to shut down....");
			break;
		}
	}

	server.sync();
	while let Some(feedback) = server.pop_coverage() {
		let rr = analysis.run(feedback.cycles, &feedback.data);
		if rr.is_interesting {
			if rr.is_invalid { println!("invalid input...."); }
			let (info, interesting_input) = server.get_info(feedback.id);
			let now = get_time();
			statistics.update_new_discovery(info.mutator.id, now, analysis.get_bitmap());
			q.add_new_test(interesting_input, info, rr.new_cov, now,
			               statistics.take_snapshot(), &feedback.data);
		}
	}

	// done with the main fuzzing part
	statistics.done();

	// final bitmap
	let bitmap = analysis.get_bitmap();

	// print inputs from queue
	if args.print_queue {
		println!("\n");
		println!("Formated Inputs and Coverage!");

		for entry in q.entries() {
			q.print_entry_summary(entry.id, &mutations);
			config.print_inputs(&entry.inputs);
			println!("Achieved Coverage:");
			let coverage = fuzz_one(server, &entry.inputs);
			config.print_test_coverage(&coverage);
			println!("\n");
		}
	}

	if args.print_total_cov {
		println!("Total Coverage:");
		config.print_bitmap(&bitmap);
	}


	// print statistics
	print!("{}", statistics.get_final_snapshot().unwrap());
	println!("Bitmap: {:?}", bitmap);

}

fn fuzz_one(server: &mut FuzzServer, input: &[u8]) -> Vec<u8> {
	let mut mutator = mutation::identity(input);
	if let Run::Done(count, _) = server.run(&mut mutator, 0) {
		assert_eq!(count, 1);
	} else { assert!(false); }
	server.sync();
	let feedback = server.pop_coverage().expect("should get exactly one coverage back!");
	feedback.data.to_vec()
}

fn get_time() -> std::time::Duration {
	let raw = time::get_time();
	std::time::Duration::new(raw.sec as u64, raw.nsec as u32)
}