extern crate libc;
extern crate time;

mod run;
mod mutation;
mod analysis;
mod queue;

use run::buffered::{ find_one_fuzz_server, BufferedFuzzServerConfig };
use run::{FuzzServer, TestSize};
use mutation::MutationInfo;

const FPGA_DIR: &'static str = "/tmp/fpga";
const TEST_SIZE : TestSize = TestSize { coverage: 16, input: 16 };

fn main() {
	// test runner
	let config = BufferedFuzzServerConfig {
		test_size : TEST_SIZE,
		test_buffer_size : 64 * 1024,
		coverage_buffer_size : 64 * 1024,
		buffer_count: 3,
	};

	println!("Test Buffer:     {} KiB", config.test_buffer_size / 1024);
	println!("Coverage Buffer: {} KiB", config.coverage_buffer_size / 1024);
	println!("Max Inputs: {}", config.test_buffer_size / 16 / 3);

	let mut server = find_one_fuzz_server(FPGA_DIR, config).expect("failed to find a fuzz server");

	// queue
	let starting_seed = vec![0u8; TEST_SIZE.input * 3];
	let mut q = queue::Queue::create("/home/kevin/hfuzz/kfuzz/out", &starting_seed);

	// analysis
	let mut analysis = analysis::Analysis::new(TEST_SIZE.coverage);

	// statistics
	let mut runs : u64 = 0;
	let start = time::PreciseTime::now();

	let max_entries = 10;
	println!("fuzzing a maximum of {} queue entries", max_entries);

	for entry_count in 0..max_entries {
		let active_test = q.get_next_test();
		println!("{}. queue entry:", entry_count + 1);
		q.debug_print_entry(active_test.id);
		for mutation_stage in mutation::MUTATIONS.iter() {
			let iterator = mutation_stage.iter(active_test.inputs.len());
			println!("running {} mutation", mutation_stage.name);
			for mutator in iterator {
				let mut input = active_test.inputs.clone();
				mutator.run(&mut input);
				server.push_test(mutator.info(), &input);
				runs += 1;
			}
			while let Some(feedback) = server.pop_coverage() {
				let is_interesting = analysis.run(&feedback.data);
				if is_interesting {
					let (info, interesting_input) = server.get_info(feedback.id);
					q.add_new_test(interesting_input, info.mutation_algo, info.mutation_id);
					println!("New Interesting Input: {:?}", feedback.id);
					println!("input:  {:?}", interesting_input);
					println!("-> cov: {:?}", feedback.data);
				}
			}
		}
		// TODO: remember last fuzzing stage here (this will be easier,
		//       once we have a MutationSchedule classe)
		q.return_test(active_test.id, 9);
	}

	server.sync();
	while let Some(feedback) = server.pop_coverage() {
		let is_interesting = analysis.run(&feedback.data);
		if is_interesting {
			let (info, interesting_input) = server.get_info(feedback.id);
			q.add_new_test(interesting_input, info.mutation_algo, info.mutation_id);
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
}

fn fuzz_one(server: &mut FuzzServer, input: &[u8]) -> Vec<u8> {
	let (info, max) = MutationInfo::custom(0, 1);
	server.push_test(&info, &input);
	server.sync();
	let feedback = server.pop_coverage().expect("should get exactly one coverage back!");
	feedback.data.to_vec()
}

fn fuzz_multiple(server: &mut FuzzServer, input: &[u8], count: u64) {
	assert!(count > 0);
	let (mut info, max) = MutationInfo::custom(0, (count+1) as u32);
	for ii in 0..count {
		server.push_test(&info, &input);
		info = info.next(max).unwrap();
	}
	server.sync();
	println!("input:  {:?}", input.to_vec());
	let first_result = server.pop_coverage().expect("should get coverage back!").data.to_vec();
	println!("-> cov[0]: {:?}", first_result);
	for ii in 0..count-1 {
		let next_result = server.pop_coverage().expect("should get more coverage back!").data.to_vec();
		println!("-> cov[{}]: {:?}", ii + 1, next_result);
		assert!(first_result == next_result);
	}
}
