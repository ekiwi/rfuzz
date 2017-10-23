extern crate time;

use std::fs;
use std::path;
use mutation::{MutationAlgorithmId, MutationId};

#[derive(Debug)]
pub struct Entry {
	pub id: EntryId,	// always equivalent to position in vector!
	pub inputs: Vec<u8>,
	pub fuzzing_stage: u32,
}

#[derive(PartialEq, PartialOrd, Debug, Clone, Copy)]
pub struct EntryId(u32);

struct Lineage {
	parent: EntryId,
	mutation_algo: MutationAlgorithmId,
	mutation_id: MutationId,
}

struct InternalEntry {
	// const
	id: EntryId,	// always equivalent to position in vector!
	inputs: Vec<u8>,
	lineage: Option<Lineage>,
	creation_time: i64,
	// variable
	fuzzing_stage: u32,
	is_being_fuzzed: bool,
}

impl InternalEntry {
	fn from_raw_inputs(id: EntryId, inputs: &[u8]) -> Self {
		let creation_time = time::get_time().sec;
		let inputs = inputs.to_vec();
		InternalEntry { id, inputs, lineage: None, creation_time,
		                fuzzing_stage: 0, is_being_fuzzed: false }
	}
	fn from_mutation(id: EntryId, inputs: &[u8], lineage: Option<Lineage>) -> Self {
		let creation_time = time::get_time().sec;
		let inputs = inputs.to_vec();
		InternalEntry { id, inputs, lineage, creation_time,
		                fuzzing_stage: 0, is_being_fuzzed: false }
	}
}

pub struct Queue {
	entries: Vec<InternalEntry>,
	/// currently only one, could become multiple once we go multi threaded
	active_entry: Option<EntryId>,
	/// used to save entries
	working_dir: path::PathBuf,
	/// used to chose the next test
	last_fuzzed_entry: Option<EntryId>,
}

impl Queue {
	/// create queue with one initial seed
	pub fn create(working_dir: &str, seed: &[u8]) -> Self {
		let entry = InternalEntry::from_raw_inputs(EntryId(0), seed);
		let working_dir = Queue::check_working_dir(working_dir);
		let last_fuzzed_entry = None;
		Queue { entries: vec![entry], active_entry: None, working_dir, last_fuzzed_entry }
	}

	fn choose_next_test(&mut self) -> EntryId {
		// TODO: take fuzzing stage into account!
		//       do not fuzz already fuzzed inputs
		let next =
			if let Some(id) = self.last_fuzzed_entry {
				if (id.0 + 1) < self.entries.len() as u32 { EntryId(id.0 + 1) }
				else { EntryId(0) }
			} else { EntryId(0) };
		self.last_fuzzed_entry = Some(next);
		next
	}

	pub fn get_next_test(&mut self) -> Entry {
		assert!(self.active_entry.is_none());
		let id = self.choose_next_test();
		let entry = self.entries.get(id.0 as usize).expect("invalid entry id");
		self.active_entry = Some(id);
		Entry { id, inputs: entry.inputs.clone(), fuzzing_stage: entry.fuzzing_stage }
	}
	pub fn return_test(&mut self, id: EntryId, fuzzing_stage: u32) {
		assert_eq!(Some(id), self.active_entry);
		let entry = self.entries.get_mut(id.0 as usize).expect("invalid entry id");
		entry.fuzzing_stage = fuzzing_stage;
		entry.is_being_fuzzed = false;
		self.active_entry = None;
	}
	pub fn add_new_test(&mut self, inputs: &[u8], mutation_algo: MutationAlgorithmId, mutation_id: MutationId) {
		assert!(self.active_entry.is_some());
		let id = EntryId(self.entries.len() as u32);
		let lineage = if let Some(parent) = self.active_entry {
			Some(Lineage { parent, mutation_algo, mutation_id }) } else { None };
		self.entries.push(InternalEntry::from_mutation(id, inputs, lineage))
	}

	/// checks wheather the parent of the working dir exists
	/// and weather it is empty
	fn check_working_dir(working_dir: &str) -> path::PathBuf {
		let dir_path = path::Path::new(working_dir);
		let parent = dir_path.parent().unwrap();
		assert!(parent.exists(), "working dir path does not exist!");
		assert!(parent.is_dir());
		if !dir_path.exists() { fs::create_dir(dir_path).unwrap(); }
		assert!(dir_path.is_dir(), "working dir needs to be a directory!");
		let file_count = fs::read_dir(dir_path).unwrap().count();
		assert_eq!(file_count, 0, "queue working dir needs to be empty");
		dir_path.to_path_buf()
	}

	// /// load saved queue from a directory
	// pub fn load(working_dir: &str, load_dir: &str) -> Self {
	// 	let dir_path = path::Path::new(dirname);
	// 	if !dir_path.exists() {
	// 		let parent_path = dir_path.parent().unwrap();
	// 		assert!(parent_path.exists());
	// 		fs::create_dir(dir_path).unwrap();
	// 	}
	// 	assert!(dir_path.is_dir());
	// 	let file_count = fs::read_dir(dir_path).unwrap().count();

	// 	if file_count > 0 {
	// 		assert!(false, "TODO: implement loading queue from filesystem")
	// 	}


	// 	let mut entries = Vec::new();
	// 	let active_entry = None;
	// 	Queue { entries, active_entry }
	// }
}
