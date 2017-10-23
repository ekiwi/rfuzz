extern crate libc;
extern crate time;

mod run;
mod mutation;
mod analysis;
mod queue;

use run::buffered::{ find_one_fuzz_server, TestSize, BufferedFuzzServerConfig };
use run::FuzzServer;

const FPGA_DIR: &'static str = "/tmp/fpga";
const TEST_SIZE : TestSize = TestSize { coverage: 12, input: 12 };

fn main() {
	// test runner
	let config = BufferedFuzzServerConfig {
		test_size : TEST_SIZE,
		test_buffer_size : 64 * 1024,
		coverage_buffer_size : 64 * 1024,
		buffer_count: 3,
	};
	let mut server = find_one_fuzz_server(FPGA_DIR, config).expect("failed to find a fuzz server");

	// queue
	let starting_seed = vec![0u8; 12 * 3];
	let mut q = queue::Queue::create("/home/kevin/hfuzz/kfuzz/out", &starting_seed);

	// analysis
	let mut analysis = analysis::Analysis::new(TEST_SIZE.coverage);

	// statistics
	let mut runs : usize = 0;
	let start = time::PreciseTime::now();

	let max_entries = 10;
	println!("fuzzing a maximum of {} queue entries", max_entries);

	for entry_count in 0..max_entries {
		let mut active_test = q.get_next_test();
		println!("{}. queue entry: {:?}", entry_count + 1, active_test);
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
				}
			}
		}
	}

	// print statistics
	let duration = start.to(time::PreciseTime::now()).num_microseconds().unwrap();
	let runs_per_second = (runs * 1000 * 1000) as f64 / duration as f64;
	println!("{:.1} runs/s ({} tests total)", runs_per_second, runs);
	println!("Discovered {} new paths.", analysis.path_count());
	println!("Discovered {} new inputs.", analysis.new_inputs_count());
}
