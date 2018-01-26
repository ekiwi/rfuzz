// Copyright 2018, Kevin Laeufer <laeufer@cs.berkeley.edu>

use super::{ Mutator, MutatorEntry, MutatorId };
use super::format::{ InputFormat, Test };

macro_rules!  v { ($major:expr, $minor:expr) => {($major as u32) << 16 | ($minor as u32) }; }
macro_rules! id { ($uid:expr, $version:expr) => {($uid as u64) << 32 | ($version as u64) }; }

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
	// TODO: allow change in seed size
	fn output_size(&self) -> usize { self.inputs.len() }
	fn apply(&self, ii: u32, output: &mut [u8]) {
		assert_eq!(self.inputs.len(), output.len());
		output.copy_from_slice(&self.inputs);
		self.mutator.apply(ii, &self.test, output);
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
	fn output_size(&self) -> usize { self.inputs.len() }
	fn apply(&self, ii: u32, output: &mut [u8]) {
		assert_eq!(self.inputs.len(), output.len());
		output.copy_from_slice(&self.inputs);
		//println!("IdMutator: out: {:?}", output);
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
	fn output_size(&self) -> usize { self.inputs.len() }
	fn apply(&self, ii: u32, output: &mut [u8]) {
		assert_eq!(self.inputs.len(), output.len());
		output.copy_from_slice(&self.inputs);
		(self.mutate)(ii, output);
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
		struct_mut!(10, "horizontal bit flag permuation", v!(0,1), HorizontalBitFlagPermuation),
		struct_mut!(11, "vertical bit flag permuation",   v!(0,1), VerticalBitFlagPermuation)
	]
}

