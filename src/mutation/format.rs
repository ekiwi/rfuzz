// TODO: find better name for this submodule which contains helper
// functions/structs for the input format, but also just general utility
// code for implementing mutators


/// a field description
struct FormatField {
	name: String,
	pos : u32,
	bits: u32,
}

pub struct InputFormat {
	/// size of one input in bytes
	size: u32,
	bits: u32,
	fields: Vec<FormatField>,
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
	pub fn bits(&self) -> u32 { self.bits }
}
