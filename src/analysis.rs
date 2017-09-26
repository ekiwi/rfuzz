extern crate twox_hash;
use std::hash::Hasher;
use std::collections::HashSet;
use self::twox_hash::XxHash;


pub struct Analysis {
	path_hashes : HashSet<u64>
}

impl Analysis {
	pub fn new() -> Analysis {
		Analysis { path_hashes: HashSet::new() }
	}

	pub fn run(&mut self, trace_bits: &[u8]) {
		let new_hash = hash_xx(trace_bits);
		if !self.path_hashes.contains(&new_hash) {
			self.path_hashes.insert(new_hash);
		}
	}

	pub fn path_count(&self) -> usize { self.path_hashes.len() }
}

fn hash_xx(input: &[u8]) -> u64 {
	let mut hasher = XxHash::default();
	hasher.write(input);
	hasher.finish()
}

fn is_interesting(trace_bits: &[u8]) {
	// TODO
}

