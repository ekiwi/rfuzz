extern crate libc;
extern crate time;

mod run;
mod mutation;
mod analysis;
mod queue;

use analysis::{Analysis};
use mutation::{MUTATIONS};
use run::FuzzServer;
use run::buffered::{ find_one_fuzz_server, TestSize };

const FPGA_DIR: &'static str = "/tmp/fpga";
const TEST_SIZE : TestSize = TestSize { coverage: 12, input: 12 };

fn main() {
	// test runner
	let mut server : FuzzServer =
		find_one_fuzz_server(FPGA_DIR, TEST_SIZE).expect("failed to find a fuzz server");

	// queue
	let starting_seed = vec![0u8; 12 * 3];
	let mut q = queue::Queue::create("/home/kevin/hfuzz/kfuzz/out", &starting_seed);

	// analysis
	let mut analysis = Analysis::new(TEST_SIZE.coverage);

	// statistics
	let mut runs : usize = 0;
	let start = time::PreciseTime::now();

	let max_entries = 10;
	println!("fuzzing a maximum of {} queue entries", max_entries);

	for entry_count in 0..max_entries {
		let mut active_test = q.get_next_test();
		println!("{}. queue entry: {:?}", entry_count + 1, active_test);
		for mutation_stage in MUTATIONS.iter() {
			let iterator = mutation_stage.iter(active_test.inputs.len());
			println!("running {} mutation", mutation_stage.name);
			for mutator in iterator {
				let mut input = active_test.inputs.clone();
				mutator.run(&mut input);
				server.push_test(&input, mutator.info());	// TODO: test info
				runs += 1;
			}
			while let Some(feedback) = server.pop_coverage() {
				let is_interesting = analysis.run(feedback.data);
				if is_interesting {
					let (info, interesting_input) = server.get_test_info(feedback.id);
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
