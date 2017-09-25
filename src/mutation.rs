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

fn bitflip_1_max(len: usize) -> usize { (len * 8) }
fn bitflip_1(ii: usize, input: &mut [u8]) {
	let byte = ii / 8;
	let bit = ii - (byte * 8);
	input[byte] ^= (1 << bit) as u8;
}
fn bitflip_2_max(len: usize) -> usize { (len * 8) - 1 }
fn bitflip_2(ii: usize, input: &mut [u8]) {
	let byte = ii / 8;
	let bit = ii - (byte * 8);
	input[byte] ^= (1 << (bit+0)) as u8;
	input[byte] ^= (1 << (bit+1)) as u8;
}
fn bitflip_4_max(len: usize) -> usize { (len * 8) - 3 }
fn bitflip_4(ii: usize, input: &mut [u8]) {
	let byte = ii / 8;
	let bit = ii - (byte * 8);
	input[byte] ^= (1 << (bit+0)) as u8;
	input[byte] ^= (1 << (bit+1)) as u8;
	input[byte] ^= (1 << (bit+2)) as u8;
	input[byte] ^= (1 << (bit+3)) as u8;
}
// similar to AFL's bitflip 8/8
fn byteflip_3_max(len: usize) -> usize { len }
fn byteflip_1(ii: usize, input: &mut [u8]) {
	input[ii] ^= 0xff;
}
fn byteflip_3_max(len: usize) -> usize { len - 1 }
fn byteflip_2(ii: usize, input: &mut [u8]) {
	input[ii]   ^= 0xff;
	input[ii+1] ^= 0xff;
}
fn byteflip_3_max(len: usize) -> usize { len - 3 }
fn byteflip_3(ii: usize, input: &mut [u8]) {
	input[ii]   ^= 0xff;
	input[ii+1] ^= 0xff;
	input[ii+2] ^= 0xff;
	input[ii+3] ^= 0xff;
}

const ARITH_MAX : i32 = 35;
fn arith_8_max(len: usize) -> usize { 2 * len * ARITH_MAX }
fn arith_8(ii: usize, input: &mut [u8]) {
	// TODO
}
