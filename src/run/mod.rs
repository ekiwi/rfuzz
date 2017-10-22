pub mod buffered;
pub mod shmem;

use super::mutation::{MutationInfo};

#[derive(Copy,Clone,Debug,PartialEq,PartialOrd)]
pub struct TestId(u64);

pub struct BasicFeedback<'a> { pub id: TestId, pub data: &'a[u8] }

pub trait FuzzServer {
	/// shedule test input for execution
	fn push_test(&mut self, info: &MutationInfo, input : &[u8]);
	/// get a reference to the coverage information from a test
	/// the TestId can be used to retrieve further info if needed
	fn pop_coverage<'a>(&'a mut self) -> Option<BasicFeedback<'a>>;
	/// must be called directly after `pop_coverage`
	fn get_info(&mut self, test: TestId) -> (MutationInfo, &[u8]);
}
