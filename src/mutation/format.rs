// TODO: find better name for this submodule which contains helper
// functions/structs for the input format, but also just general utility
// code for implementing mutators


/// a field description
pub struct FormatField {
	pub name: String,
	pub pos : u32,
	pub bits: u32,
}

pub struct InputFormat {
	/// size of one input in bytes
	pub size: u32,
	pub bits: u32,
	pub fields: Vec<FormatField>,
}

impl InputFormat {
	pub fn new(field_name_bits: Vec<(String,u32)>) -> Self {
		let mut bits = 0 as u32;
		let mut fields = Vec::new();
		let mut last_bits = u32::max_value();
		for (n, b) in field_name_bits {
			let ff = FormatField { name: n, pos: bits, bits: b };
			assert!(ff.bits <= last_bits, "fields must be sorted by bitwidth");
			last_bits = ff.bits;
			fields.push(ff);
			bits += b;
		}
		let min_bytes = (bits + 7) / 8;
		let size = min_bytes + (min_bytes % 4);
		InputFormat { size, bits, fields }
	}
	pub fn size(&self) -> usize { self.size as usize }
}

pub struct Test {
	cycle_count: u32,
	bits_per_cycle: u32,
	bytes_per_cycle: u32,
}

impl Test {
	pub fn wrap(format: &InputFormat, data: &[u8]) -> Self {
		let cycle_count = (data.len() / format.size()) as u32;
		assert_eq!(format.size() * cycle_count as usize, data.len(),
		           "test does not contain an integer number of cycles");
		let bits_per_cycle = format.bits;
		let bytes_per_cycle = format.size() as u32;
		Test { cycle_count, bits_per_cycle, bytes_per_cycle }
	}
	pub fn cycle_count(&self) -> u32 { self.cycle_count }
	pub fn field(&self, pos: u32, bits: u32) -> Option<Field> {
		assert!(bits <= 64, "fields wider than 64 bits are currently not supported");
		if bits > 0 {
			let last_bit = pos + bits - 1;
			if last_bit < self.bits_per_cycle {
				let cycle_count = self.cycle_count;
				let bytes_per_cycle = self.bytes_per_cycle;
				Some(Field { cycle_count, bytes_per_cycle, pos, bits })
			} else { None }
		} else { None }
	}
}

pub struct Field {
	cycle_count: u32,
	bytes_per_cycle: u32,
	pos : u32,
	bits: u32,
}

impl Field {
	pub fn in_cycle(&self, cycle: u32) -> Option<FieldInstance> {
		if cycle < self.cycle_count {
			let byte_offset = cycle * self.bytes_per_cycle;
			Some(FieldInstance { pos: self.pos, bits: self.bits, byte_offset })
		} else { None }
	}
	pub fn set(&self, data: &mut [u8], value: u64) {
		let pos = self.pos; let bits = self.bits;
		for cycle in 0 .. self.cycle_count {
			let byte_offset = cycle * self.bytes_per_cycle;
			FieldInstance{ pos, bits, byte_offset }.set(data, value);
		}
	}
	pub fn flip(&self, data: &mut [u8], mask: u64) {
		let pos = self.pos; let bits = self.bits;
		for cycle in 0 .. self.cycle_count {
			let byte_offset = cycle * self.bytes_per_cycle;
			FieldInstance{ pos, bits, byte_offset }.flip(data, mask);
		}
	}
}

pub struct FieldInstance {
	pos : u32,
	bits: u32,
	byte_offset: u32
}

impl FieldInstance {
	pub fn get(&self, data: &[u8]) -> u64 {
		// TODO: take cycle offset into account!
		let bits = self.bits;
		let mask = 2u64.pow(bits) - 1;
		// start
		let start_bit = self.pos;
		let start_byte = (start_bit / 8) as usize + self.byte_offset as usize;
		// stop
		let stop_bit = start_bit + bits - 1;
		let stop_byte = (stop_bit / 8) as usize + self.byte_offset as usize;
		let bits_right_of_stop = 7 - (stop_bit % 8);
		let shift_right = bits_right_of_stop;
		// extraction
		let mut value = 0u64;
		for byte in start_byte..stop_byte+1 {
			if byte == stop_byte {
				value <<= 8 - shift_right;
				value |= (data[byte] >> shift_right) as u64;
			} else {
				value <<= 8;
				value |= data[byte] as u64;
			}
		}
		value & mask
	}
	pub fn set(&mut self, data: &mut [u8], value: u64) {
		// TODO: take cycle offset into account!
		let bits = self.bits;
		// start
		let start_bit = self.pos;
		let start_byte = (start_bit / 8) as usize + self.byte_offset as usize;
		let bits_left_of_start = start_bit % 8;
		let start_keep_mask = (2u8.pow(bits_left_of_start) - 1) << (7 - bits_left_of_start);
		let start_new_mask = (2u32.pow(8 - bits_left_of_start) - 1) as u8;
		// stop
		let stop_bit = start_bit + bits - 1;
		let stop_byte = (stop_bit / 8) as usize + self.byte_offset as usize;
		let bits_right_of_stop = 7 - (stop_bit % 8);
		let stop_keep_mask = 2u8.pow(bits_right_of_stop) - 1;
		// set value
		if start_byte == stop_byte {
			let old = data[start_byte];
			let old_bits = (start_keep_mask | stop_keep_mask) & old;
			let new = old_bits | (((value as u8) << bits_right_of_stop) & start_new_mask);
			data[start_byte] = new;
		} else {
			for byte in start_byte..stop_byte+1 {
				let old = data[byte];
				let bytes_right = stop_byte - byte;
				let bits_right = if byte != stop_byte { bytes_right as u32 * 8 - bits_right_of_stop } else { 0 };
				let new =
					if byte == start_byte {
						(value >> bits_right) as u8 & start_new_mask |
						old & start_keep_mask
					} else if byte == stop_byte {
						(value << bits_right_of_stop) as u8 |
						old & stop_keep_mask
					} else {
						(value >> bits_right) as u8
					};
				data[byte] = new;
			}
		}
	}
	pub fn flip(&mut self, data: &mut [u8], mask: u64) {
		let old = self.get(data);
		// TODO: this can be performance improved
		self.set(data, old ^ mask)
	}
}

