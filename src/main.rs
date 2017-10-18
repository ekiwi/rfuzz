extern crate libc;
extern crate time;

mod run;
mod mutation;
mod analysis;
mod queue;

use analysis::{Analysis};
use mutation::{MUTATIONS};
use run::buffered::{list_potential_fuzz_servers, find_one_fuzz_server, TestBuffer, CoverageBuffer, TestSize };

const FPGA_DIR: &'static str = "/tmp/fpga";
const TEST_SIZE : TestSize = TestSize { coverage: 12, input: 12 };

fn main() {
	list_potential_fuzz_servers(FPGA_DIR);

	// take the first fuzz server and open a connection to it
	let mut server  = find_one_fuzz_server(FPGA_DIR).expect("failed to find a fuzz server");

	// allocate a shared memory buffer that we will then push to the fuzz server
	let mut test_buf = TestBuffer::create(TEST_SIZE, 64 * 1024);
	let mut cov_buf  = CoverageBuffer::create(TEST_SIZE, 64 * 1024);
	// TODO: make sure that coverage buffer is large enough

	// setup queue
	let starting_seed = vec![0u8; 12 * 3];
	let mut q = queue::Queue::create("/home/kevin/hfuzz/kfuzz/out", &starting_seed);

	let mut runs : usize = 0;
	let mut test_id : u64 = 10;	// important: this is not the queue EntryId!
	let start = time::PreciseTime::now();
	let mut io_time = 0 as i64;
	let mut analysis = Analysis::new(TEST_SIZE.coverage);

	let max_entries = 10;
	println!("fuzzing a maximum of {} queue entries", max_entries);

	for entry_count in 0..max_entries {
		let mut active_test = q.get_next_test();
		println!("{}. queue entry: {:?}", entry_count + 1, active_test);
		let mut mutation_id = 0 as u32;
		// TODO: there seems to be some confusion about Mutator vs Mutation!
		for mutation in MUTATIONS.iter() {
			let iterator = mutation.iter(active_test.inputs.len());
			runs += iterator.max;
			println!("running circuit {} times with {} mutation", iterator.max, mutation.name);
			let mut mutator_id = 0 as usize;
			for mutator in iterator {
				let mut input = active_test.inputs.clone();
				mutator.run(&mut input);
				// try to add test to buffer, handle full buffer
				if test_buf.add_test(test_id, &input).is_err() {
					let io_start = time::PreciseTime::now();
					server.push_buffer(test_buf, cov_buf);
					// TODO: use second buffer
					let (mut a, mut b) = server.pop_buffer().expect("failed to get buffer back");
					io_time += io_start.to(time::PreciseTime::now()).num_microseconds().unwrap();
					test_buf = a;
					cov_buf = b;
					// analyze coverage
					while let Some((id, cov)) = cov_buf.get_coverage() {
						let is_interesting = analysis.run(cov);
						if is_interesting {
							// TODO: get the actual input that the coverage corresponds to!
							q.add_new_test(&input, mutation_id, mutator_id);
						}
					}
					test_buf.add_test(test_id, &input).expect("failed to place test in buffer");
				}
				test_id += 1;
				mutator_id += 1;
			}
			mutation_id += 1;
		}
		q.return_test(active_test.id, mutation_id);
	}
	if !test_buf.is_empty() {
		let io_start = time::PreciseTime::now();
		server.push_buffer(test_buf, cov_buf);
		let (_, _) = server.pop_buffer().expect("failed to get buffer back");
		io_time += io_start.to(time::PreciseTime::now()).num_microseconds().unwrap();
	}
	let duration = start.to(time::PreciseTime::now()).num_microseconds().unwrap();
	let runs_per_second = (runs * 1000 * 1000) as f64 / duration as f64;
	println!("{:.1} runs/s ({} tests total)", runs_per_second, runs);
	println!("Discovered {} new paths.", analysis.path_count());
	println!("Discovered {} new inputs.", analysis.new_inputs_count());
	let io_ratio = io_time as f64 / duration as f64;
	println!("I/O time: {} ms ({:.2}%)", io_time as f64 / 1000 as f64, io_ratio * 100.);
}
