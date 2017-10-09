#[cfg(FUZZ_AFL)]
pub mod afl;
pub mod shmem;

// TODO: implement Hang, Error, NoInst, NoBits
// TODO: make more generic
#[derive(Debug)]
pub enum Fault { None, Crash{signal: i32}}

pub trait CoverageMap {
	fn as_slice_u8(&self) -> &[u8];
	fn as_slice_u16(&self) -> &[u16];
}

// TODO: implement better feedback interface!
// pub trait FeedbackConsumer {
// 	fn consume(&mut self, fault : Fault, coverage : &CoverageMap);
// }

// pub struct DummyConsumer {}
// impl FeedbackConsumer for DummyConsumer {
// 	fn consume(&mut self, fault: Fault, coverage: &CoverageMap) {}
// }

pub trait TestRunner {
	fn run(&self, input : &[u8]) -> Fault;
	fn coverage(&self) -> &CoverageMap;
}
