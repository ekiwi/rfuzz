mod format;
mod mutators;

use std::collections::{ HashMap, HashSet };
use rand;
use rand::{ SeedableRng, Rng };
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
	mutators: Vec<MutatorEntry>,
	mutator_id_to_name: HashMap<u64, String>
}

impl MutationSchedule {
	pub fn initialize(test_size: TestSize, input: Vec<(String,u32)>) -> Self {
		let input_size = test_size.input;
		let format = InputFormat::new(input, input_size);
		let mutators = mutators::get_list();
		let mut mutator_id_to_name = HashMap::with_capacity(mutators.len());
		for mutator in &mutators {
			mutator_id_to_name.insert(mutator.id, mutator.name.clone());
		}
		MutationSchedule { format, input_size, mutators, mutator_id_to_name }
	}

	pub fn get_mutator(&self, history: &mut MutationHistory, inputs: &[u8]) -> Option<Box<Mutator>> {
		for mutator in &self.mutators {
			assert!(mutator.deterministic, "non-deterministic mutators not suported at the moment!");
			// TODO: for non-deterministic mutators, the single hash set is not really going to work....
			if !history.finished.contains(&mutator.id) {
				history.finished.insert(mutator.id);
				return Some((mutator.create)(&self.format, inputs));
			}
		}
		// hacky non-deterministic stage
		{
			let mut rng = rand::thread_rng();
			let seed : Seed = [rng.next_u32(), rng.next_u32(), rng.next_u32(), rng.next_u32()];
			return Some(Box::new(mutators::RandomBitflipMutator::create(&self.format, inputs, seed)));
		}
	}

	pub fn get_name(&self, id: MutatorId) -> &str {
		&self.mutator_id_to_name[&id.id]
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
	fn apply(&mut self, ii: u32, output: &mut [u8]);
}

pub(crate) type Seed = [u32; 4];

#[derive(Hash,Copy,Clone,Debug,PartialEq,Eq,PartialOrd)]
pub struct MutatorId {
	id: u64,
	seed: Option<Seed>,
}

#[derive(Copy,Clone,Debug,PartialEq,PartialOrd)]
pub struct MutationInfo {
	pub mutator: MutatorId,
	pub ii: u32,
}
