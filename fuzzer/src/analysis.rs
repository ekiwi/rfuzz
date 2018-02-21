extern crate twox_hash;
use std::hash::Hasher;
use std::collections::HashSet;
use self::twox_hash::XxHash;
use std::cmp;
use run::TestSize;


pub struct Analysis {
	path_hashes : HashSet<u64>,
	bitmap: Vec<u8>,
	new_inputs : usize

}
/// analyses the coverage assuming packed 1-bit coverage counters
impl Analysis {
	pub fn new(test_size: TestSize) -> Analysis {
		Analysis {
			path_hashes: HashSet::new(),
			bitmap: vec![0xff; test_size.coverage],
			new_inputs: 0,
		}
	}

	pub fn run(&mut self, trace_bits: &[u8]) -> bool {
		// check coverage
		let new_cov = analyze_coverage(self.bitmap.as_mut(), trace_bits);
		let is_interesting =
		match new_cov {
			NewCoverage::Branch => { println!("New branch covered!"); true },
			NewCoverage::BranchCount => { println!("New branch count discovered!"); true},
			_ => false
		};
		self.new_inputs += if new_cov != NewCoverage::None {1} else {0};
		// check path
		let new_hash = hash_xx(trace_bits);
		if !self.path_hashes.contains(&new_hash) {
			self.path_hashes.insert(new_hash);
		}
		is_interesting
	}

	/// returns the number of coverage points that have been covered at least once
	pub fn coverage_count(&self) -> usize {
		self.bitmap.iter().map(|&x| x.count_zeros() as usize).sum()
	}
	pub fn path_count(&self) -> usize { self.path_hashes.len() }
	pub fn new_inputs_count(&self) -> usize { self.new_inputs }
	pub fn get_bitmap(&self) -> Vec<u8> {
		self.bitmap.clone()
	}
}

fn hash_xx(input: &[u8]) -> u64 {
	let mut hasher = XxHash::default();
	hasher.write(input);
	hasher.finish()
}

fn bin(count: u8) -> u8 {
	match count {
		0           => 0,
		1           => (1 << 0),
		2           => (1 << 1),
		3           => (1 << 2),
		4 ... 7     => (1 << 3),
		8 ... 15    => (1 << 4),
		16 ... 31   => (1 << 5),
		32 ... 127  => (1 << 6),
		_           => (1 << 7),
	}
}

#[derive(Clone, Copy, PartialEq)]
enum NewCoverage { None, BranchCount, Branch }

fn analyze_coverage(bitmap: &mut [u8], trace_bits: &[u8]) -> NewCoverage {
	assert_eq!(bitmap.len(), trace_bits.len());
	let len = cmp::min(bitmap.len(), trace_bits.len());
	let mut new_cov = NewCoverage::None;
	for i in 0..len {
		let old = bitmap[i];
		let new_count = trace_bits[i];
		if new_count != 0 {
			let new = bin(new_count);
			if (new & old) != 0 {
				if new_cov != NewCoverage::Branch {
					new_cov = if old == 0xff { NewCoverage::Branch }
					else { NewCoverage::BranchCount };
				}
				bitmap[i] &= !new; // delete new bits from the bitmap
			}
		}
	}
	new_cov
}
