pub struct Mutation {
	pub name: &'static str,
	max:   fn(usize) -> usize,
	apply: fn(usize, &mut [u8])
}

pub const MUTATIONS : [Mutation; 9] = [
	Mutation { name: "bitflip  1/1", max: bitflip_1_max,  apply: bitflip_1 },
	Mutation { name: "bitflip  2/1", max: bitflip_2_max,  apply: bitflip_2 },
	Mutation { name: "bitflip  4/1", max: bitflip_4_max,  apply: bitflip_4 },
	Mutation { name: "bitflip  8/8", max: byteflip_1_max, apply: byteflip_1 },
	Mutation { name: "bitflip 16/8", max: byteflip_2_max, apply: byteflip_2 },
	Mutation { name: "bitflip 32/8", max: byteflip_4_max, apply: byteflip_4 },
	Mutation { name: "arith  8/8",   max:  arith_8_max,   apply:  arith_8 },
	Mutation { name: "arith 16/8",   max: arith_16_max,   apply: arith_16 },
	Mutation { name: "arith 32/8",   max: arith_32_max,   apply: arith_32 },
];

impl Mutation {
	pub fn iter(&self, len: usize) -> MutationIterator {
		MutationIterator { ii: 0, max: (self.max)(len), apply: self.apply }
	}
}

pub struct MutationIterator {
	ii: usize,
	pub max: usize,
	apply: fn(usize, &mut [u8])
}

impl Iterator for MutationIterator {
	type Item = Mutator;
	fn next(&mut self) -> Option<Mutator> {
		if self.ii < self.max {
			let ii = self.ii;
			let apply = self.apply;
			self.ii += 1;
			Some(Mutator { ii, apply })
		} else {
			None
		}
	}
}

pub struct Mutator {
	ii: usize,
	apply: fn(usize, &mut [u8])
}

impl Mutator {
	pub fn run(&self, input : &mut [u8]) {
		(self.apply)(self.ii, input)
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
fn byteflip_1_max(len: usize) -> usize { len }
fn byteflip_1(ii: usize, input: &mut [u8]) {
	input[ii] ^= 0xff;
}
fn byteflip_2_max(len: usize) -> usize { len - 1 }
fn byteflip_2(ii: usize, input: &mut [u8]) {
	input[ii]   ^= 0xff;
	input[ii+1] ^= 0xff;
}
fn byteflip_4_max(len: usize) -> usize { len - 3 }
fn byteflip_4(ii: usize, input: &mut [u8]) {
	input[ii]   ^= 0xff;
	input[ii+1] ^= 0xff;
	input[ii+2] ^= 0xff;
	input[ii+3] ^= 0xff;
}

const ARITH_MAX : usize = 35;
fn arith_8_max(len: usize) -> usize { 2 * len * ARITH_MAX }
fn arith_8(ii: usize, input: &mut [u8]) {
	let byte    = ii / ARITH_MAX / 2;
	let rest    = ii - (byte * ARITH_MAX * 2);
	let b = (rest / 2) as i8;
	let a = input[byte] as i8;
	let add_not_sub = (rest & 1) == 0;
	input[byte] = if add_not_sub { a + b } else { a - b } as u8;
}
#[derive(Clone, Copy)]
enum Endian { Big, Little }
fn read_u16(end: Endian, mem: &[u8], byte: usize) -> u16 {
	match end {
		Endian::Big    => (mem[byte+0] as u16) << 8 | (mem[byte+1] as u16),
		Endian::Little => (mem[byte+1] as u16) << 8 | (mem[byte+0] as u16),
	}
}
fn write_u16(end: Endian, mem: &mut [u8], byte: usize, value: u16) {
	let high = (value >> 8) as u8;
	let low  = (value & 0xff) as u8;
	match end {
		Endian::Big    => { mem[byte+0] = high; mem[byte+1] = low; },
		Endian::Little => { mem[byte+1] = high; mem[byte+0] = low; }
	}
}
fn arith_16_max(len: usize) -> usize { 4 * (len-1) * ARITH_MAX }
fn arith_16(ii: usize, input: &mut [u8]) {
	let byte    = ii / ARITH_MAX / 4;
	let rest    = ii - (byte * ARITH_MAX * 4);
	let b = (rest / 4) as i16;
	let add_not_sub = (rest & 2) == 0;
	let endian = if (rest & 1) == 1 { Endian::Big } else { Endian::Little };
	let a = read_u16(endian, input, byte) as i16;
	let res = if add_not_sub { a + b } else { a - b} as u16;
	write_u16(endian, input, byte, res);
}
fn read_u32(end: Endian, mem: &[u8], byte: usize) -> u32 {
	match end {
		Endian::Big    => (mem[byte+0] as u32) << 24 | (mem[byte+1] as u32) << 16 |
		                  (mem[byte+2] as u32) <<  8 | (mem[byte+3] as u32) <<  0,
		Endian::Little => (mem[byte+3] as u32) << 24 | (mem[byte+2] as u32) << 16 |
		                  (mem[byte+1] as u32) <<  8 | (mem[byte+0] as u32) <<  0,
	}
}
fn write_u32(end: Endian, mem: &mut [u8], byte: usize, value: u32) {
	let byte_3 = ((value >> 24) & 0xff) as u8;
	let byte_2 = ((value >> 16) & 0xff) as u8;
	let byte_1 = ((value >>  8) & 0xff) as u8;
	let byte_0 = ((value >>  0) & 0xff) as u8;
	match end {
		Endian::Big    => { mem[byte+0] = byte_3; mem[byte+1] = byte_2;
		                    mem[byte+2] = byte_1; mem[byte+3] = byte_0; },
		Endian::Little => { mem[byte+3] = byte_3; mem[byte+2] = byte_2;
		                    mem[byte+1] = byte_1; mem[byte+0] = byte_0; },
	}
}
fn arith_32_max(len: usize) -> usize { 4 * (len-3) * ARITH_MAX }
fn arith_32(ii: usize, input: &mut [u8]) {
	let byte    = ii / ARITH_MAX / 4;
	let rest    = ii - (byte * ARITH_MAX * 4);
	let b = (rest / 4) as i32;
	let add_not_sub = (rest & 2) == 0;
	let endian = if (rest & 1) == 1 { Endian::Big } else { Endian::Little };
	let a = read_u32(endian, input, byte) as i32;
	let res = if add_not_sub { a + b } else { a - b} as u32;
	write_u32(endian, input, byte, res);
}
