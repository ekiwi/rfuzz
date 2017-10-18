







#[derive(PartialEq, PartialOrd)]
struct EntryId(u32);
impl EntryId { fn next(self) -> EntryId { EntryId(self.0+1) } }

struct Lineage {
	// TODO: could be none! parent: Entry,
	mutator: u32,
	stage: usize,
}

struct Entry {
	// const
	id: EntryId,	// always equivalent to position in vector!
	input: Vec<u8>,
	lineage: Lineage,
	creation_time: i64,
	// variable
	fuzzing_stage: u32,
	is_being_fuzzed: bool,
}

pub struct Queue {
	entries: Vec<Entry>,
	/// currently only one, could become multiple once we go multi threaded
	active_entry: EntryId,
	next_entry_id: EntryId,
}

// TODO: * get_test: get a copy of (id, input, fuzzing_stage) of an entry, mark this entry as being_fuzzed
//       * return_test(id, fuzzing_stage): update fuzzing_stage and mark test as not being_fuzzed
//       * add_new_test(input, mutator, stage): assert(active_entry), create and add new entry to end of queue


// impl Queue {
	// creates a new queue if filename points to empty directory
	// pub fn open(filename: &str) -> Self {

	// }

	// fn add(&mut self, ) {

	// }
// }
