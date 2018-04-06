mod format;
mod mutators;

use std::collections::{ HashMap, HashSet };
use rand;
use rand::Rng;
use self::format::InputFormat;
use run::TestSize;

/// saved with each entry in the queue
/// this is used so that we don't repeat history
/// (and thus not waste any cycles)
#[derive(Default,Debug,Clone,Serialize,Deserialize)]
pub struct MutationHistory {
	finished: HashSet<u64>
}

pub struct MutationScheduleConfig {
	pub skip_deterministic: bool,
	pub skip_non_deterministic: bool,
	pub independent_random: bool,
}

/// contains a list of possible mutations
pub struct MutationSchedule {
	config: MutationScheduleConfig,
	format: InputFormat,
	/// length of input in bytes including padding
	input_size: usize,
	///
	mutators: Vec<MutatorEntry>,
	mutator_id_to_name: HashMap<u64, String>
}

impl MutationSchedule {
	pub fn initialize(config: MutationScheduleConfig, test_size: TestSize, input: Vec<(String,u32)>) -> Self {
		let input_size = test_size.input;
		let format = InputFormat::new(input, input_size);
		let mutators = mutators::get_list();
		let mut mutator_id_to_name = HashMap::with_capacity(mutators.len());
		for mutator in &mutators {
			mutator_id_to_name.insert(mutator.id, mutator.name.clone());
		}
		// TODO: fix horrible hack!!!
		mutator_id_to_name.insert(mutators::RANDOM_BITFLIP_MUTATOR_ID, "random biflips".to_string());
		mutator_id_to_name.insert(mutators::AFL_HAVOC_MUTATOR_ID, "afl havoc".to_string());
		mutator_id_to_name.insert(mutators::RANDOM_GENERATOR_MUTATOR_ID, "random".to_string());
		MutationSchedule { config, format, input_size, mutators, mutator_id_to_name }
	}

	pub fn get_mutator(&self, history: &mut MutationHistory, inputs: &[u8]) -> Option<Box<Mutator>> {
		if self.config.independent_random {
			let mut rng = rand::thread_rng();
			let seed : Seed = [rng.next_u32(), rng.next_u32(), rng.next_u32(), rng.next_u32()];
			let mutator = Box::new(mutators::RandomGenerator::create(inputs.len(), seed));
			Some(mutator)
		} else {
			if !self.config.skip_deterministic {
				for mutator in &self.mutators {
					assert!(mutator.deterministic, "non-deterministic mutators not suported at the moment!");
					// TODO: for non-deterministic mutators, the single hash set is not really going to work....
					if !history.finished.contains(&mutator.id) {
						history.finished.insert(mutator.id);
						return Some((mutator.create)(&self.format, inputs));
					}
				}
			}
			// hacky non-deterministic stage
			if !self.config.skip_non_deterministic {
				let mut rng = rand::thread_rng();
				let seed : Seed = [rng.next_u32(), rng.next_u32(), rng.next_u32(), rng.next_u32()];
				//let mutator = Box::new(mutators::RandomBitflipMutator::create(&self.format, inputs, seed));
				let mutator = Box::new(mutators::AflHavocMutator::create(&self.format, inputs, seed));
				return Some(mutator);
			}
			None
		}
	}

	pub fn get_name(&self, id: MutatorId) -> &str {
		&self.mutator_id_to_name[&id.id]
	}

	pub fn get_names(&self) -> Vec<(String, u64)> {
		self.mutator_id_to_name.iter().map(|(id, name)| (name.clone(), *id)).collect()
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
	/// the number of bytes that *all* mutation results have, None if the output size is variable
	fn output_size(&self) -> Option<usize>;
	/// apply mutation `ii` on input (`ii` in [0, max]) and write it to output
	fn apply(&mut self, ii: u32, output: &mut [u8]) -> usize;
}

pub(crate) type Seed = [u32; 4];

#[derive(Hash,Copy,Clone,Debug,PartialEq,Eq,PartialOrd,Serialize,Deserialize)]
pub struct MutatorId {
	pub id: u64,
	seed: Option<Seed>,
}

#[derive(Copy,Clone,Debug,PartialEq,PartialOrd,Serialize,Deserialize)]
pub struct MutationInfo {
	pub mutator: MutatorId,
	pub ii: u32,
}
