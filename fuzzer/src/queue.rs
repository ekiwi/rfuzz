extern crate time;

use std::time::Duration;
use std::fs;
use std::path;
use std::clone::Clone;
use std::env;
use mutation::{MutationInfo, MutationHistory, MutationSchedule};

#[derive(Debug)]
pub struct Entry {
	pub id: EntryId,	// always equivalent to position in vector!
	pub inputs: Vec<u8>,
	pub mutation_history: MutationHistory,
}

impl Entry {
	fn from_internal(entry: &InternalEntry) -> Self {
		Entry { id: entry.id,
		        inputs: entry.inputs.clone(),
		        mutation_history: entry.mutation_history.clone() }
	}
}

#[derive(PartialEq, PartialOrd, Debug, Clone, Copy, Serialize, Deserialize)]
pub struct EntryId(u32);

#[derive(Debug, Serialize, Deserialize)]
struct Lineage {
	parent: EntryId,
	mutation: MutationInfo
}

#[derive(Debug, Serialize, Deserialize)]
struct InternalEntry {
	// const
	id: EntryId,	// always equivalent to position in vector!
	inputs: Vec<u8>,
	lineage: Option<Lineage>,
	creation_time: Duration,
	// variable
	mutation_history: MutationHistory,
}

impl InternalEntry {
	fn from_raw_inputs(id: EntryId, inputs: &[u8], ts: Duration) -> Self {
		let inputs = inputs.to_vec();
		InternalEntry { id, inputs, lineage: None, creation_time:  ts,
		                mutation_history: MutationHistory::default() }
	}
	fn from_mutation(id: EntryId, inputs: &[u8], lineage: Option<Lineage>, ts: Duration) -> Self {
		let inputs = inputs.to_vec();
		InternalEntry { id, inputs, lineage, creation_time:  ts,
		                mutation_history: MutationHistory::default() }
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
	pub fn create(working_dir: &str, seed: &[u8], start: Duration) -> Self {
		let entry = InternalEntry::from_raw_inputs(EntryId(0), seed, start);
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

	pub fn entries(&self) -> Vec<Entry> {
		self.entries.iter().map(|ref e| Entry::from_internal(e)).collect()
	}
	pub fn get_next_test(&mut self) -> Entry {
		assert!(self.active_entry.is_none());
		let id = self.choose_next_test();
		let entry = self.entries.get(id.0 as usize).expect("invalid entry id");
		self.active_entry = Some(id);
		Entry::from_internal(entry)
	}
	pub fn return_test(&mut self, id: EntryId, mutation_history: MutationHistory) {
		assert_eq!(Some(id), self.active_entry);
		let entry = self.entries.get_mut(id.0 as usize).expect("invalid entry id");
		entry.mutation_history = mutation_history;
		self.active_entry = None;
	}
	pub fn add_new_test(&mut self, inputs: &[u8], mutation: MutationInfo, ts: Duration) {
		assert!(self.active_entry.is_some());
		let id = EntryId(self.entries.len() as u32);
		let lineage = if let Some(parent) = self.active_entry {
			Some(Lineage { parent, mutation }) } else { None };
		self.entries.push(InternalEntry::from_mutation(id, inputs, lineage, ts))
	}
	pub fn debug_print_entry(&self, id: EntryId) {
		if let Some(ee) = self.entries.get(id.0 as usize) {
			println!("{:?}", ee);
		}
	}
	pub fn print_entry_summary(&self, id: EntryId, mutations: &MutationSchedule) {
		if let Some(ee) = self.entries.get(id.0 as usize) {
			println!("{}. Queue Entry", ee.id.0);
			if let Some(ref lineage) = ee.lineage {
				println!("Generated from {}. Entry", lineage.parent.0);
				println!("In stage {:?} of mutation algorithm {:?}.",
				         lineage.mutation.ii,
				         mutations.get_name(lineage.mutation.mutator));
			}
			// TODO: creation time
		}
	}

	/// checks wheather the parent of the working dir exists
	/// and weather it is empty
	fn check_working_dir(working_dir: &str) -> path::PathBuf {
		println!("check_working_dir({})", working_dir);
		let raw_path = path::Path::new(working_dir);
		let cwd_rel_path = env::current_dir().unwrap().join(raw_path);
		let dir_path = if raw_path.is_relative() { &cwd_rel_path } else { raw_path };
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
