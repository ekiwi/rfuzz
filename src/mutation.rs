pub struct BitFlip {
	bit_count: u32,
	input_size: usize,
	ii: usize,
	pub max: usize,
}

impl BitFlip {
	pub fn create(bit_count: u32, input_size: usize) -> BitFlip {
		let ii = 0;
		let max = input_size * 8 - (bit_count as usize) + 1;
		BitFlip { bit_count, input_size, ii, max }
	}
}

impl Iterator for BitFlip {
	type Item = Mutator;
	fn next(&mut self) -> Option<Mutator> {
		if self.ii < self.max {
			let ii = self.ii;
			self.ii += 1;
			Some(Mutator { ii })
		} else {
			None
		}
	}
}

pub struct Mutator {
	ii: usize
}

impl Mutator {
	pub fn run(&self, input : &mut [u8]) {
		let byte = self.ii / 8;
		let bit = self.ii - (byte * 8);
		input[byte] ^= (1 << bit) as u8;
	}
}
