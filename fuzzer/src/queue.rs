extern crate time;

use std::time::Duration;
use std::fs;
use std::path;
use std::clone::Clone;
use std::env;
use mutation::{MutationInfo, MutationHistory, MutationSchedule};
use stats;
use serde_json;
use std::io::Write;

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

#[derive(Debug, Serialize, Deserialize, Clone)]
struct Lineage {
	parent: EntryId,
	mutation: MutationInfo
}

#[derive(Serialize, Deserialize)]
struct EntryFile {
	entry: InternalEntry,
	stats: stats::Snapshot,
	trace_bits: Vec<u8>,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
struct InternalEntry {
	// const
	id: EntryId,	// always equivalent to position in vector!
	inputs: Vec<u8>,
	lineage: Option<Lineage>,
	discovered_after: Duration,
	new_cov: Vec<usize>, // indices of newly covered counters
	// variable
	mutation_history: MutationHistory,
}

impl InternalEntry {
	fn from_raw_inputs(id: EntryId, inputs: &[u8], ts: Duration,
	                   new_cov: Vec<usize>) -> Self {
		let inputs = inputs.to_vec();
		InternalEntry { id, inputs, lineage: None, discovered_after:  ts,
		                mutation_history: MutationHistory::default(), new_cov }
	}
	fn from_mutation(id: EntryId, inputs: &[u8], lineage: Option<Lineage>,
	                 ts: Duration, new_cov: Vec<usize>) -> Self {
		let inputs = inputs.to_vec();
		InternalEntry { id, inputs, lineage, discovered_after:  ts,
		                mutation_history: MutationHistory::default(), new_cov }
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
	// start time used for calculating the delta T for input discoveries
	start_ts: Duration,
}

impl Queue {
	/// create queue with one initial seed
	pub fn create(working_dir: &str, seed: &[u8], seed_cov: Vec<usize>,
	              start_ts: Duration, config: String, stats: stats::Snapshot,
	              trace_bits: &[u8]) -> Self {
		let working_dir = Queue::check_working_dir(working_dir);
		Queue::save_config(&working_dir, config);
		let entry = InternalEntry::from_raw_inputs(EntryId(0), seed, Duration::default(), seed_cov);
		Queue::save_to_working_dir(&working_dir, &entry, stats, trace_bits);
		let last_fuzzed_entry = None;
		Queue { entries: vec![entry], active_entry: None, working_dir, last_fuzzed_entry, start_ts }
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
	pub fn add_new_test(&mut self, inputs: &[u8], mutation: MutationInfo,
	                    new_cov: Vec<usize>, ts: Duration,
	                    stats: stats::Snapshot, trace_bits: &[u8]) {
		assert!(self.active_entry.is_some());
		let id = EntryId(self.entries.len() as u32);
		let lineage = if let Some(parent) = self.active_entry {
			Some(Lineage { parent, mutation }) } else { None };
		let after = ts - self.start_ts;
		let entry = InternalEntry::from_mutation(id, inputs, lineage, after, new_cov);
		Queue::save_to_working_dir(&self.working_dir, &entry, stats, trace_bits);
		self.entries.push(entry)
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
			println!("Newly Covered: {:?}", &ee.new_cov);
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

	fn save_config(working_dir: &path::Path, j: String) {
		let filename = working_dir.join("config.json");
		let mut file = fs::File::create(filename).expect("Failed to create config json log file!");
		file.write_all(j.as_bytes()).expect("Failed to write entry to file!");
	}

	fn save_to_working_dir(working_dir: &path::Path, entry: &InternalEntry, stats: stats::Snapshot, trace_bits: &[u8]) {
		let content = EntryFile { entry: entry.clone(), stats, trace_bits: trace_bits.to_vec() };
		let j = serde_json::to_string(&content).expect("failed to serialize entry!");
		let filename = working_dir.join(format!("entry_{:04}.json", entry.id.0));
		let mut file = fs::File::create(filename).expect("Failed to create entry json log file!");
		file.write_all(j.as_bytes()).expect("Failed to write entry to file!");
	}
}
