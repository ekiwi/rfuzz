extern crate libc;
extern crate time;
extern crate toml;
#[macro_use] extern crate serde_derive;
extern crate colored;
#[macro_use] extern crate prettytable;

mod config;
mod run;
mod mutation;
mod analysis;
mod queue;
use std::borrow::Borrow;
use run::buffered::{ find_one_fuzz_server, BufferedFuzzServerConfig };
use run::FuzzServer;

const FPGA_DIR: &'static str = "/tmp/fpga";
const WORD_SIZE : usize = 8;

fn main() {
	let args: Vec<_> = std::env::args().collect();
	assert!(args.len() >= 2, "Please specify the config TOML file!");

	// load test config
	let test_config_file = &args[1];//"../hardware-afl/ICache.toml";
	let config = config::Config::from_file(WORD_SIZE, test_config_file);
	let test_size = config.get_test_size();
	config.print_header();

	// test runner
	let srv_config = BufferedFuzzServerConfig {
		test_size : test_size,
		test_buffer_size : 64 * 1024,
		coverage_buffer_size : 64 * 1024,
		buffer_count: 3,
	};

	println!("Test Buffer:     {} KiB", srv_config.test_buffer_size / 1024);
	println!("Coverage Buffer: {} KiB", srv_config.coverage_buffer_size / 1024);
	println!("Max Inputs: {}", srv_config.test_buffer_size / 16 / 3);

	let mut server = find_one_fuzz_server(FPGA_DIR, srv_config).expect("failed to find a fuzz server");

	// queue
	let starting_seed = vec![0u8; test_size.input * 3];
	let mut q = queue::Queue::create("/home/kevin/hfuzz/kfuzz/out", &starting_seed);

	// analysis
	let mut analysis = analysis::Analysis::new(test_size);
	let seed_coverage = fuzz_one(&mut server, &starting_seed, 0);
	analysis.run(&seed_coverage);
	// TODO: support multiple seeds

	// mutation
	let mutations = mutation::MutationSchedule::initialize(test_size, config.get_inputs());

	// statistics
	let mut runs : u64 = 0;
	let start = time::PreciseTime::now();

	let max_entries = 10;
	println!("fuzzing a maximum of {} queue entries", max_entries);

	for entry_count in 0..max_entries {
		let active_test = q.get_next_test();
		let mut history = active_test.mutation_history;
		println!("{}. queue entry:", entry_count + 1);
		q.debug_print_entry(active_test.id);
		while let Some(mutator) = mutations.get_mutator(&mut history, &active_test.inputs) {
			println!("running {} mutation", mutations.get_name(mutator.borrow()));
			server.run(mutator.borrow());
			runs += mutator.max() as u64;

			while let Some(feedback) = server.pop_coverage() {
				let is_interesting = analysis.run(&feedback.data);
				if is_interesting {
					let (info, interesting_input) = server.get_info(feedback.id);
					q.add_new_test(interesting_input, info);
					println!("New Interesting Input: {:?}", feedback.id);
					println!("input:  {:?}", interesting_input);
					println!("-> cov: {:?}", feedback.data);
				}
			}
		}
		q.return_test(active_test.id, history);
	}

	server.sync();
	while let Some(feedback) = server.pop_coverage() {
		let is_interesting = analysis.run(&feedback.data);
		if is_interesting {
			let (info, interesting_input) = server.get_info(feedback.id);
			q.add_new_test(interesting_input, info);
		}
	}

	// print statistics
	let duration = start.to(time::PreciseTime::now()).num_microseconds().unwrap();
	let runs_per_second = (runs * 1000 * 1000) as f64 / duration as f64;
	println!("{:.1} runs/s ({} tests total)", runs_per_second, runs);
	println!("Discovered {} new paths.", analysis.path_count());
	println!("Discovered {} new inputs.", analysis.new_inputs_count());
	let bitmap = analysis.get_bitmap();
	println!("Bitmap: {:?}", bitmap);

	// print formated statistics
	println!("\n\n");
	println!("NEW: Formated Inputs and Coverage!");

	let mut ii = 1u16;
	for entry in q.entries() {
		q.print_entry_summary(entry.id);
		config.print_inputs(&entry.inputs);
		println!("Achieved Coverage:");
		let coverage = fuzz_one(&mut server, &entry.inputs, ii);
		ii += 1;
		config.print_coverage(&coverage, false);
		println!("\n");
	}

	println!("Total Coverage:");
	config.print_coverage(&bitmap, true);
}

// TODO: make work with new mutation interface!
fn fuzz_one(server: &mut FuzzServer, input: &[u8], ii: u16) -> Vec<u8> {
	let mutator = mutation::identity(input);
	server.run(mutator.borrow());
	server.sync();
	let feedback = server.pop_coverage().expect("should get exactly one coverage back!");
	feedback.data.to_vec()
}

// fn fuzz_multiple(server: &mut FuzzServer, input: &[u8], count: u64) {
// 	assert!(count > 0);
// 	let (mut info, max) = MutationInfo::custom(0, (count+1) as u32);
// 	for ii in 0..count {
// 		server.push_test(&info, &input);
// 		info = info.next(max).unwrap();
// 	}
// 	server.sync();
// 	println!("input:  {:?}", input.to_vec());
// 	let first_result = server.pop_coverage().expect("should get coverage back!").data.to_vec();
// 	println!("-> cov[0]: {:?}", first_result);
// 	for ii in 0..count-1 {
// 		let next_result = server.pop_coverage().expect("should get more coverage back!").data.to_vec();
// 		println!("-> cov[{}]: {:?}", ii + 1, next_result);
// 		assert!(first_result == next_result);
// 	}
// }
