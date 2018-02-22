// Copyright 2018, Kevin Laeufer <laeufer@cs.berkeley.edu>

use super::{ Mutator, MutatorEntry, MutatorId, Seed };
use super::format::{ InputFormat, Test };

macro_rules!  v { ($major:expr, $minor:expr) => {($major as u32) << 16 | ($minor as u32) }; }
macro_rules! id { ($uid:expr, $version:expr) => {($uid as u64) << 32 | ($version as u64) }; }

use rand;
use rand::{ SeedableRng, Rng };
use std;

////////////////////////////////////////////////////////////////////////////////
// Random Mutators
////////////////////////////////////////////////////////////////////////////////
// TODO
// For now there is only one random mutator and it will need to be handled as
// a special case in the mutation schedule.



pub struct RandomBitflipMutator {
	id: MutatorId,
	inputs: Vec<u8>,
	test: Test,
	rng: rand::XorShiftRng,
	max: u32,
	bits_per_cycle: u32,
	last_ii: Option<u32>,
}

pub const RANDOM_BITFLIP_MUTATOR_ID : u64 = id!(100, v!(0,1));

impl RandomBitflipMutator {
	pub fn create(format: &InputFormat, inputs: &[u8], seed: Seed) -> Self {
		let max = 10000;

		let id = MutatorId { id: RANDOM_BITFLIP_MUTATOR_ID, seed: Some(seed) };
		let test = Test::wrap(format, inputs);
		let rng = rand::XorShiftRng::from_seed(seed);
		let bits_per_cycle = format.bits;
		let last_ii = None;
		RandomBitflipMutator { id, inputs: inputs.to_vec(), test, rng, max, bits_per_cycle, last_ii }
	}
}

impl Mutator for RandomBitflipMutator {
	fn id(&self) -> MutatorId { self.id }
	fn max(&self) -> u32 { self.max }
	fn output_size(&self) -> Option<usize> { Some(self.inputs.len()) }
	fn apply(&mut self, ii: u32, output: &mut [u8]) -> usize {
		// parameters:
		let max_flips = 200;
		let min_flips = 1;

		// checks
		assert_eq!(self.inputs.len(), output.len());
		if let Some(last) = self.last_ii {
			assert_eq!(last + 1, ii);
		}
		self.last_ii = Some(ii);

		// copy input to output
		output.copy_from_slice(&self.inputs);

		// chose random set of bits to flip in random cycle
		let flips = self.rng.gen_range(min_flips, max_flips + 1);
		for _ in 0..flips {
			let cycle = self.rng.gen_range(0, self.test.cycle_count());
			let bit = self.rng.gen_range(0, self.bits_per_cycle);
			self.test.field(bit, 1).unwrap().in_cycle(cycle).unwrap().flip(output, 1);
		}
		self.inputs.len()
	}
}

////////////////////////////////////////////////////////////////////////////////
// Field Structure Aware Mutators
////////////////////////////////////////////////////////////////////////////////

/// wrapper that contains some functionality/state that is common to all
/// field structure aware mutators
struct FieldAwareMutatorWrapper<M> where M: FieldAwareMutator {
	id: u64,
	mutator: M,
	test: Test,
	inputs: Vec<u8>,
}

impl<M> FieldAwareMutatorWrapper<M> where M: FieldAwareMutator {
	fn create(id: u64, format: &InputFormat, seed: &[u8]) -> Self {
		let test = Test::wrap(format, seed);
		let mutator = M::initialize(format, test.cycle_count());
		let inputs = seed.to_vec();
		FieldAwareMutatorWrapper { id, mutator, test, inputs }
	}
}

impl<M> Mutator for FieldAwareMutatorWrapper<M> where M: FieldAwareMutator {
	fn id(&self) -> MutatorId { MutatorId { id: self.id, seed: None } }
	fn max(&self) -> u32 { self.mutator.max() }
	fn output_size(&self) -> Option<usize> { Some(self.inputs.len()) }
	fn apply(&mut self, ii: u32, output: &mut [u8]) -> usize {
		assert_eq!(self.inputs.len(), output.len());
		output.copy_from_slice(&self.inputs);
		self.mutator.apply(ii, &self.test, output);
		self.inputs.len()
	}
}

// helper macros to declare field structure aware mutators
/// in the registry at the bottom of this submodule
macro_rules! struct_mut {
	($uid:expr, $name:expr, $version:expr, $mutator:ty) => {
		MutatorEntry {
			id: id!($uid, $version),
			name: String::from($name),
			version: $version,
			deterministic: true,
			create: Box::new(|format: &InputFormat, seed: &[u8]| {
				Box::new(FieldAwareMutatorWrapper::<$mutator>::create(
					id!($uid, $version), format, seed))
			})}
		};
}

trait FieldAwareMutator {
	fn initialize(format: &InputFormat, cycle_count: u32) -> Self;
	fn max(&self) -> u32;
	fn apply(&self, ii: u32, test: &Test, data: &mut [u8]);
}


/// try all permutations for all bitflags in each cycle
struct HorizontalBitFlagPermuation {
	/// number of flag bits; all flags will be adjacent
	flag_width: u32,
	/// first flag bit
	flag_pos: u32,
	/// calculated during initalization
	max: u32,
	permuations: u32,
}
impl FieldAwareMutator for HorizontalBitFlagPermuation {
	fn initialize(format : &InputFormat, cycle_count: u32) -> Self {
		let max_flag_size = 1u32;
		let ff = &format.fields;
		let flag_width = ff.iter().filter(|f| f.bits <= max_flag_size).count() as u32;
		let flag_pos = ff.iter().filter(|f| f.bits <= max_flag_size).next().map(|f| f.pos).unwrap_or(0);
		let permuations = 2u32.pow(flag_width) - 1;
		let max = cycle_count * permuations;
		HorizontalBitFlagPermuation { flag_width, flag_pos, max, permuations}
	}
	fn max(&self) -> u32 { self.max }
	fn apply(&self, ii: u32, test: &Test, data: &mut [u8]) {
		let cycle_num =  ii / self.permuations;
		let bitflips  = (ii % self.permuations) + 1;
		test.field(self.flag_pos, self.flag_width).unwrap()
			.in_cycle(cycle_num).unwrap()
			.flip(data, bitflips as u64);
	}
}

/// try all permutations for each bitflag in all cycles
struct VerticalBitFlagPermuation {
	/// number of flag bits; all flags will be adjacent
	flag_width: u32,
	/// first flag bit
	flag_pos: u32,
	/// calculated during initalization
	max: u32,
	permuations: u32,
}
impl FieldAwareMutator for VerticalBitFlagPermuation {
	fn initialize(format : &InputFormat, cycle_count: u32) -> Self {
		let max_flag_size = 1u32;
		let ff = &format.fields;
		let flag_width = ff.iter().filter(|f| f.bits <= max_flag_size).count() as u32;
		let flag_pos = ff.iter().filter(|f| f.bits <= max_flag_size).next().map(|f| f.pos).unwrap_or(0);
		let permuations = 2u32.pow(cycle_count);
		let max = (flag_width * permuations);
		VerticalBitFlagPermuation { flag_width, flag_pos, max, permuations}
	}
	fn max(&self) -> u32 { self.max }
	fn apply(&self, ii: u32, test: &Test, data: &mut [u8]) {
		let flag_id = ii / self.flag_width;
		let bitflips = ii % self.permuations;
		test.field(self.flag_pos + flag_id, 1).unwrap().flip(data, bitflips as u64);
	}
}


////////////////////////////////////////////////////////////////////////////////
// Special Case Mutators
////////////////////////////////////////////////////////////////////////////////

/// used for running a single input through the fuzzer
pub struct IdentityMutator { inputs: Vec<u8> }
impl IdentityMutator {
	pub fn create(seed: &[u8]) -> Self {
		IdentityMutator { inputs: seed.to_vec() }
	}
}
impl Mutator for IdentityMutator {
	fn id(&self) -> MutatorId { MutatorId { id: 0, seed: None } }
	fn max(&self) -> u32 { 1 }
	fn output_size(&self) -> Option<usize> { Some(self.inputs.len()) }
	fn apply(&mut self, ii: u32, output: &mut [u8]) -> usize {
		assert_eq!(self.inputs.len(), output.len());
		output.copy_from_slice(&self.inputs);
		//println!("IdMutator: out: {:?}", output);
		self.inputs.len()
	}
}

////////////////////////////////////////////////////////////////////////////////
// AFL Style Mutators
////////////////////////////////////////////////////////////////////////////////

struct AflStyleConstLengthMutator {
	max_fn: fn(len: u32) -> u32,
	mutate: fn(ii: u32, input: &mut [u8]),
	id: u64,
	inputs: Vec<u8>,
}

impl Mutator for AflStyleConstLengthMutator {
	fn id(&self) -> MutatorId { MutatorId { id: self.id, seed: None } }
	fn max(&self) -> u32 { (self.max_fn)(self.inputs.len() as u32) }
	fn output_size(&self) -> Option<usize> { Some(self.inputs.len()) }
	fn apply(&mut self, ii: u32, output: &mut [u8]) -> usize {
		assert_eq!(self.inputs.len(), output.len());
		output.copy_from_slice(&self.inputs);
		(self.mutate)(ii, output);
		self.inputs.len()
	}
}

// helper macros to declare AFL style mutators in the registry at the bottom of
// this submodule
macro_rules! afl_mut {
	($uid:expr, $name:expr, $version:expr, $max:expr, $mutate:expr) => {
		MutatorEntry {
			id: id!($uid, $version),
			name: String::from($name),
			version: $version,
			deterministic: true,
			create: Box::new(|_: &InputFormat, seed: &[u8]| {
				Box::new(AflStyleConstLengthMutator {
					max_fn: $max,
					mutate: $mutate,
					id: id!($uid, $version),
					inputs: seed.to_vec()
				})
			})}
		};
}

fn bitflip_1_max(len: u32) -> u32 { len * 8 }
fn bitflip_1(ii: u32, input: &mut [u8]) {
	let byte = ii / 8;
	let bit = ii - (byte * 8);
	input[byte as usize] ^= (1 << bit) as u8;
}
fn bitflip_2_max(len: u32) -> u32 { (len * 8) - 1 }
fn bitflip_2(ii: u32, input: &mut [u8]) {
	let byte = ii / 8;
	let bit = ii - (byte * 8);
	input[byte as usize] ^= (1 << (bit+0)) as u8;
	input[byte as usize] ^= (1 << (bit+1)) as u8;
}
fn bitflip_4_max(len: u32) -> u32 { (len * 8) - 3 }
fn bitflip_4(ii: u32, input: &mut [u8]) {
	let byte = ii / 8;
	let bit = ii - (byte * 8);
	input[byte as usize] ^= (1 << (bit+0)) as u8;
	input[byte as usize] ^= (1 << (bit+1)) as u8;
	input[byte as usize] ^= (1 << (bit+2)) as u8;
	input[byte as usize] ^= (1 << (bit+3)) as u8;
}
// similar to AFL's bitflip 8/8
fn byteflip_1_max(len: u32) -> u32 { len }
fn byteflip_1(ii: u32, input: &mut [u8]) {
	let pos = ii as usize;
	input[pos] ^= 0xff;
}
fn byteflip_2_max(len: u32) -> u32 { len - 1 }
fn byteflip_2(ii: u32, input: &mut [u8]) {
	let pos = ii as usize;
	input[pos]   ^= 0xff;
	input[pos+1] ^= 0xff;
}
fn byteflip_4_max(len: u32) -> u32 { len - 3 }
fn byteflip_4(ii: u32, input: &mut [u8]) {
	let pos = ii as usize;
	input[pos]   ^= 0xff;
	input[pos+1] ^= 0xff;
	input[pos+2] ^= 0xff;
	input[pos+3] ^= 0xff;
}

const ARITH_MAX : u32 = 35;
fn arith_8_max(len: u32) -> u32 { 2 * len * ARITH_MAX }
fn arith_8(ii: u32, input: &mut [u8]) {
	let byte    = ii / ARITH_MAX / 2;
	let rest    = ii - (byte * ARITH_MAX * 2);
	let b = (rest / 2) as i8;
	let a = input[byte as usize] as i8;
	let add_not_sub = (rest & 1) == 0;
	input[byte as usize] = if add_not_sub { a.wrapping_add(b) }
	                       else { a.wrapping_sub(b) } as u8;
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
fn arith_16_max(len: u32) -> u32 { 4 * (len-1) * ARITH_MAX }
fn arith_16(ii: u32, input: &mut [u8]) {
	let byte    = (ii / ARITH_MAX / 4) as usize;
	let rest    = ii - (byte as u32 * ARITH_MAX * 4);
	let b = (rest / 4) as i16;
	let add_not_sub = (rest & 2) == 0;
	let endian = if (rest & 1) == 1 { Endian::Big } else { Endian::Little };
	let a = read_u16(endian, input, byte) as i16;
	let res = if add_not_sub { a.wrapping_add(b) } else { a.wrapping_sub(b) } as u16;
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
fn arith_32_max(len: u32) -> u32 { 4 * (len-3) * ARITH_MAX }
fn arith_32(ii: u32, input: &mut [u8]) {
	let byte    = (ii / ARITH_MAX / 4) as usize;
	let rest    = ii - (byte as u32 * ARITH_MAX * 4);
	let b = (rest / 4) as i32;
	let add_not_sub = (rest & 2) == 0;
	let endian = if (rest & 1) == 1 { Endian::Big } else { Endian::Little };
	let a = read_u32(endian, input, byte) as i32;
	let res = if add_not_sub { a.wrapping_add(b) } else { a.wrapping_sub(b) } as u32;
	write_u32(endian, input, byte, res);
}

const INTERESTING_8 : [i8; 9] = [-128, -1, 0, 1, 16, 32, 64, 100, 127];
fn int_8_max(len: u32) -> u32 { len * INTERESTING_8.len() as u32 }
fn int_8(ii: u32, input: &mut [u8]) {
	let pos = ii as usize / INTERESTING_8.len();
	let interesting = INTERESTING_8[ii as usize - pos * INTERESTING_8.len()] as u8;
	input[pos] = interesting;
}

const INTERESTING_16 : [i16; 10] =
	[-32768, -129, 128, 255, 256, 512, 1000, 1024, 4096, 32767];
fn int_16_max(len: u32) -> u32 { 2 * (len - 1) * INTERESTING_16.len() as u32 }
fn int_16(ii: u32, input: &mut [u8]) {
	let pos  = ii as usize        / INTERESTING_16.len() / 2;
	let rest = ii as usize - (pos * INTERESTING_16.len() * 2);
	let interesting = INTERESTING_16[rest / 2] as u16;
	let endian = if (rest & 1) == 1 { Endian::Big } else { Endian::Little };
	write_u16(endian, input, pos, interesting);
}

const INTERESTING_32 : [i32; 8] =
	[-2147483648, -100663046, -32769, 32768, 65535, 65536, 100663045, 2147483647];
fn int_32_max(len: u32) -> u32 { 2 * (len - 3) * INTERESTING_32.len() as u32 }
fn int_32(ii: u32, input: &mut [u8]) {
	let pos  = ii as usize        / INTERESTING_32.len() / 2;
	let rest = ii as usize - (pos * INTERESTING_32.len() * 2);
	let interesting = INTERESTING_32[rest / 2] as u32;
	let endian = if (rest & 1) == 1 { Endian::Big } else { Endian::Little };
	write_u32(endian, input, pos, interesting);
}


////////////////////////////////////////////////////////////////////////////////
// Random AFL Style Mutator
////////////////////////////////////////////////////////////////////////////////
// TODO
// For now this mutator needs to be handled as a special case in the mutation schedule.



#[derive(Debug)]
pub struct AflHavocMutator {
	id: MutatorId,
	havoc_blk_small : u32,
	havoc_blk_medium : u32,
	inputs: Vec<u8>,
	rng: rand::XorShiftRng,
	max: u32,
	last_ii: Option<u32>,
}

pub const AFL_HAVOC_MUTATOR_ID : u64 = id!(110, v!(0,1));

impl AflHavocMutator {
	pub fn create(format: &InputFormat, inputs: &[u8], seed: Seed) -> Self {
		let max = 1024;

		let id = MutatorId { id: AFL_HAVOC_MUTATOR_ID, seed: Some(seed) };
		let havoc_blk_small  = (format.size() * 1) as u32;
		let havoc_blk_medium = (format.size() * 4) as u32;
		let rng = rand::XorShiftRng::from_seed(seed);
		let last_ii = None;
		AflHavocMutator { id, havoc_blk_small, havoc_blk_medium,
		                  inputs: inputs.to_vec(), rng, max, last_ii }
	}

	// based on AFL's choose_block_len function, but a bit less sophisticated
	fn choose_block_len(&mut self, limit: u32) -> u32 {
		// we ignore the time that we have been fuzzing for and the number of queue cycles
		// instead we scale the block size in relation to our input size
		// AFL uses 32 and 128 as BLK_SMALL and BLK_MEDIUM value, we will
		// use size.input * 1/4 which gets us similar values assuming an input
		// size of 40 bytes
		assert!(limit > 0);

		// While AFL gives equal probability to picking the small or medium
		// block size after 10min of fuzzing, we will bias the selection
		// towards the smaller size.
		let (min_blk, max_blk) =
			if(self.rng.gen_weighted_bool(4)) { (1, self.havoc_blk_small) }
			else { (self.havoc_blk_small, self.havoc_blk_medium) };
		let min = if min_blk < limit { min_blk } else { 1 };
		let max = std::cmp::min(max_blk, limit);
		self.rng.gen_range(min, max + 1)
	}

	fn apply_havoc_step(&mut self, mutation: HavocMutation, output: &mut [u8], len: u32) -> u32 {
		match mutation {
			HavocMutation::FlipBit => {
				let ii = self.rng.gen_range(0, bitflip_1_max(len));
				bitflip_1(ii, output);
				len
			},
			HavocMutation::Interest8 => {
				let ii = self.rng.gen_range(0, int_8_max(len));
				int_8(ii, output);
				len
			},
			HavocMutation::Interest16 => {
				if len >= 2 {
					let ii = self.rng.gen_range(0, int_16_max(len));
					int_16(ii, output);
				}
				len
			},
			HavocMutation::Interest32 => {
				if len >= 4 {
					let ii = self.rng.gen_range(0, int_32_max(len));
					int_32(ii, output);
				}
				len
			},
			HavocMutation::Arith8 => {
				let ii = self.rng.gen_range(0, arith_8_max(len));
				arith_8(ii, output);
				len
			},
			HavocMutation::Arith16 => {
				if len >= 2 {
					let ii = self.rng.gen_range(0, arith_16_max(len));
					arith_16(ii, output);
				}
				len
			},
			HavocMutation::Arith32 => {
				if len >= 4 {
					let ii = self.rng.gen_range(0, arith_32_max(len));
					arith_32(ii, output);
				}
				len
			},
			HavocMutation::Random8 => {
				let pos = self.rng.gen_range(0, len) as usize;
				let flips : u8 = self.rng.gen_range(0, 255) + 1;
				output[pos] ^= flips;
				len
			},
			HavocMutation::DeleteBytes => {
				if len >= 2 {
					let del_len = self.choose_block_len(len - 1);
					let del_from = self.rng.gen_range(0, len - del_len + 1);

					let src = (del_from + del_len) as usize;
					let dst = del_from as usize;
					let count = (len - del_from - del_len) as usize;
					unsafe {
						std::ptr::copy(output[src..].as_ptr(), output[dst..].as_mut_ptr(), count);
					}

					len - del_len
				} else { len }
			},
			_ => {
				//println!("TODO: implement {:?}", mutation);
				len
			}
		}
	}
}

#[derive(Debug, Clone, Copy)]
enum HavocMutation {
	FlipBit, Interest8, Interest16, Interest32, Arith8, Arith16, Arith32,
	Random8, DeleteBytes, CloneBytes, OverwriteBytes
}

impl Mutator for AflHavocMutator {
	fn id(&self) -> MutatorId { self.id }
	fn max(&self) -> u32 { self.max }
	fn output_size(&self) -> Option<usize> { None }
	fn apply(&mut self, ii: u32, output: &mut [u8]) -> usize {
		// checks
		assert!(output.len() >= self.inputs.len());
		if let Some(last) = self.last_ii {
			assert_eq!(last + 1, ii);
		}
		self.last_ii = Some(ii);


		// copy input to output
		let orig_len = self.inputs.len();
		output[..orig_len].copy_from_slice(&self.inputs);

		// pick the number of stacked mutations
		let use_stacking = *self.rng.choose(&[2,4,8,16,32,64,128]).unwrap();
		// println!("use_stacking: {}", use_stacking);
		// keep track of how much we have extended the output
		let mut len = orig_len as u32;
		for _ in 0..use_stacking {
			// chose mutation to apply
			let mutation = self.rng.choose(&[
				HavocMutation::FlipBit,
				HavocMutation::Interest8,
				HavocMutation::Interest16,
				HavocMutation::Interest32,
				HavocMutation::Arith8,  HavocMutation::Arith8,
				HavocMutation::Arith16, HavocMutation::Arith16,
				HavocMutation::Arith32, HavocMutation::Arith32,
				HavocMutation::Random8,
				HavocMutation::DeleteBytes, HavocMutation::DeleteBytes,
				HavocMutation::CloneBytes,
				HavocMutation::OverwriteBytes,
			]).unwrap();
			len = self.apply_havoc_step(*mutation, output, len);
		}
	len as usize
	}
}

////////////////////////////////////////////////////////////////////////////////
// Mutator Registry
////////////////////////////////////////////////////////////////////////////////
// This needs to be at the bottom of the file because of our macro use,
// which is an unfortunate shortcoming of Rust.


pub(crate) fn get_list() -> Vec<MutatorEntry> {
	vec![
		afl_mut!( 1, "bitflip  1/1", v!(1,0), bitflip_1_max,  bitflip_1),
		afl_mut!( 2, "bitflip  2/1", v!(1,0), bitflip_2_max,  bitflip_2),
		afl_mut!( 3, "bitflip  4/1", v!(1,0), bitflip_4_max,  bitflip_4),
		afl_mut!( 4, "bitflip  8/8", v!(1,0), byteflip_1_max, byteflip_1),
		afl_mut!( 5, "bitflip 16/8", v!(1,0), byteflip_2_max, byteflip_2),
		afl_mut!( 6, "bitflip 32/8", v!(1,0), byteflip_4_max, byteflip_4),
		afl_mut!( 7, "arith    8/8", v!(1,0),    arith_8_max,    arith_8),
		afl_mut!( 8, "arith   16/8", v!(1,0),   arith_16_max,   arith_16),
		afl_mut!( 9, "arith   32/8", v!(1,0),   arith_32_max,   arith_32),
		afl_mut!(10, "interest 8/8", v!(1,0),      int_8_max,      int_8),
		afl_mut!(11, "interest 16/8", v!(1,0),    int_16_max,     int_16),
		afl_mut!(12, "interest 32/8", v!(1,0),    int_32_max,     int_32),
		// struct_mut!(10, "horizontal bit flag permuation", v!(0,1), HorizontalBitFlagPermuation),
		// struct_mut!(11, "vertical bit flag permuation",   v!(0,1), VerticalBitFlagPermuation)
	]
}

