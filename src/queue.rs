


pub struct Queue {
}


enum EntryId {
	Id(u32),
	None,
}

struct Lineage {
	parent: EntryId,
	mutator: u32,
	stage: usize,
	creation_time: i64,
}

struct Entry {
	id: EntryId,
	input: Vec<u8>,
	lineage: Lineage,
	fuzzing_stage: u32,






}

impl Queue {
	/// creates a new queue if filename points to empty directory
	pub fn open(filename: &str) -> Self {
	}

	fn add_test(&mut self) -> u64 {

	}
}
