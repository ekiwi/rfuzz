pub mod buffered;
mod history;
mod rwint;
#[cfg(feature = "shmem")]
mod shmem;
#[cfg(feature = "dma")]
mod pynq;
#[cfg(feature = "dma")]
mod pynqchannel;

use super::mutation::{MutationInfo, Mutator};

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

// TODO: return reference to coverage instead of copy
pub struct BasicFeedback { pub id: TestId, pub cycles: u16, pub data: Vec<u8> }

pub enum Run { Done(u32), Yield(u32) }

pub trait FuzzServer {
	/// shedule test input for execution
	fn run(&mut self, mutator: &mut Box<Mutator>, start: u32) -> Run;
	/// get a copy of the coverage information from a test
	/// the TestId can be used to retrieve further info if needed
	fn pop_coverage(&mut self) -> Option<BasicFeedback>;
	/// must be called directly after `pop_coverage`
	fn get_info(&mut self, test: TestId) -> (MutationInfo, &[u8]);
	/// send all waiting tests to the fuzz server and wait
	/// until the fuzz server returns all coverage
	fn sync(&mut self);
}
