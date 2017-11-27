pub mod buffered;
mod history;
#[cfg(not(target_arch = "arm"))]
mod shmem;
#[cfg(target_arch = "arm")]
mod pynq;

use super::mutation::{MutationInfo};

#[derive(Copy,Clone,Debug,PartialEq,PartialOrd,Default)]
pub struct TestId(u64);
impl TestId {
	fn next(&self) -> TestId { TestId(self.0 + 1) }
}

#[derive(Copy, Clone)]
pub struct TestSize {
	pub coverage: usize,
	pub input: usize,
}

impl TestSize {
	pub fn new(coverage_size: usize, input_size: usize) -> Self {
		assert_eq!(coverage_size % 8, 0);
		assert_eq!(input_size % 8, 0);
		TestSize { coverage: coverage_size, input: input_size }
	}
}


// TODO: return reference to coverage instead of copy
pub struct BasicFeedback { pub id: TestId, pub data: Vec<u8> }

pub trait FuzzServer {
	/// shedule test input for execution
	fn push_test(&mut self, info: &MutationInfo, input : &[u8]);
	/// get a copy of the coverage information from a test
	/// the TestId can be used to retrieve further info if needed
	fn pop_coverage(&mut self) -> Option<BasicFeedback>;
	/// must be called directly after `pop_coverage`
	fn get_info(&mut self, test: TestId) -> (MutationInfo, &[u8]);
	/// send all waiting tests to the fuzz server and wait
	/// until the fuzz server returns all coverage
	fn sync(&mut self);
}
