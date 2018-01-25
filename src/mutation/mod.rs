mod format;
mod mutators;

use std::collections::{ HashMap, HashSet, BTreeMap };
use self::format::InputFormat;
use run::TestSize;

/// saved with each entry in the queue
/// this is used so that we don't repeat history
/// (and thus not waste any cycles)
#[derive(Default,Debug,Clone)]
pub struct MutationHistory {
	finished: HashSet<u64>
}

/// contains a list of possible mutations
pub struct MutationSchedule {
	format: InputFormat,
	/// length of input in bytes including padding
	input_size: usize,
	///
	mutators: BTreeMap<u64, MutatorEntry>
}

impl MutationSchedule {
	pub fn initialize(test_size: TestSize, input: Vec<(String,u32)>) -> Self {
		let format = InputFormat::new(input);
		let input_size = test_size.input;
		let list = mutators::get_list();
		let mut mutators = BTreeMap::new(); //with_capacity(list.len());
		for mutator in list {
			mutators.insert(mutator.id, mutator);
		}
		MutationSchedule { format, input_size, mutators }
	}

	pub fn get_mutator(&self, history: &mut MutationHistory, seed: &[u8]) -> Option<Box<Mutator>> {
		for mutator in self.mutators.values() {
			assert!(mutator.deterministic, "non-deterministic mutators not suported at the moment!");
			// TODO: for non-deterministic mutators, the single hash set is not really going to work....
			if !history.finished.contains(&mutator.id) {
				history.finished.insert(mutator.id);
				return Some((mutator.create)(&self.format, seed));
			}
		}
		None
	}

	pub fn get_name(&self, mutator: &Mutator) -> &str {
		&self.mutators[&mutator.id().id].name
	}
}

pub fn identity(seed: &[u8]) -> Box<Mutator> {
	Box::new(mutators::IdentityMutator::create(seed))
}

pub(crate) struct MutatorEntry {
	id: u64,
	name: String,
	version: u32,
	deterministic: bool,
	create: Box<Fn(&InputFormat, &[u8]) -> Box<Mutator>>,
}

pub trait Mutator {
	/// unique id + Option<seed>
	fn id(&self) -> MutatorId;
	/// number of different mutations that can be performed for this instance
	fn max(&self) -> u32;
	/// the number of bytes that *all* mutation results have
	fn output_size(&self) -> usize;
	/// apply mutation `ii` on input (`ii` in [0, max]) and write it to output
	fn apply(&self, ii: u32, output: &mut [u8]);
}

#[derive(Hash,Copy,Clone,Debug,PartialEq,Eq,PartialOrd)]
pub struct MutatorId {
	id: u64,
	seed: Option<u64>,
}

#[derive(Copy,Clone,Debug,PartialEq,PartialOrd)]
pub struct MutationInfo {
	pub mutator: MutatorId,
	pub ii: u32,
}
