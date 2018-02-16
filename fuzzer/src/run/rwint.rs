use std;

pub trait ReadIntsBigEndian : std::io::Read {
	fn read_u16(&mut self) -> std::io::Result<u16> {
		let mut data: [u8; 2] = [0; 2];
		self.read_exact(&mut data)?;
		let val = (data[0] as u16) <<  8 | (data[1] as u16) <<  0;
		Ok(val)
	}

	fn read_u32(&mut self) -> std::io::Result<u32> {
		let mut data: [u8; 4] = [0; 4];
		self.read_exact(&mut data)?;
		let val = (data[0] as u32) << 24 | (data[1] as u32) << 16 |
		          (data[2] as u32) <<  8 | (data[3] as u32) <<  0;
		Ok(val)
	}

	fn read_u64(&mut self) -> std::io::Result<u64> {
		let mut data: [u8; 8] = [0; 8];
		self.read_exact(&mut data)?;
		let val = (data[0] as u64) << 56 | (data[1] as u64) << 48 |
		          (data[2] as u64) << 40 | (data[3] as u64) << 32 |
		          (data[4] as u64) << 24 | (data[5] as u64) << 16 |
		          (data[6] as u64) <<  8 | (data[7] as u64) <<  0;
		Ok(val)
	}
}

pub trait WriteIntsBigEndian : std::io::Write {
	fn write_u16(&mut self, val: u16) -> std::io::Result<()> {
		let data = [(val >>  8) as u8, (val >>  0) as u8];
		self.write_all(&data)
	}

	fn write_u32(&mut self, val: u32) -> std::io::Result<()> {
		let data = [(val >> 24) as u8, (val >> 16) as u8,
		            (val >>  8) as u8, (val >>  0) as u8];
		self.write_all(&data)
	}

	fn write_u64(&mut self, val: u64) -> std::io::Result<()> {
		let data = [(val >> 56) as u8, (val >> 48) as u8,
		            (val >> 40) as u8, (val >> 32) as u8,
		            (val >> 24) as u8, (val >> 16) as u8,
		            (val >>  8) as u8, (val >>  0) as u8];
		self.write_all(&data)
	}
}

pub trait ReadIntsLittleEndian : std::io::Read {
	fn read_u16(&mut self) -> std::io::Result<u16> {
		let mut data: [u8; 2] = [0; 2];
		self.read_exact(&mut data)?;
		let val = (data[1] as u16) <<  8 | (data[0] as u16) <<  0;
		Ok(val)
	}

	fn read_u32(&mut self) -> std::io::Result<u32> {
		let mut data: [u8; 4] = [0; 4];
		self.read_exact(&mut data)?;
		let val = (data[3] as u32) << 24 | (data[2] as u32) << 16 |
		          (data[1] as u32) <<  8 | (data[0] as u32) <<  0;
		Ok(val)
	}

	fn read_u64(&mut self) -> std::io::Result<u64> {
		let mut data: [u8; 8] = [0; 8];
		self.read_exact(&mut data)?;
		let val = (data[7] as u64) << 56 | (data[6] as u64) << 48 |
		          (data[5] as u64) << 40 | (data[4] as u64) << 32 |
		          (data[3] as u64) << 24 | (data[2] as u64) << 16 |
		          (data[1] as u64) <<  8 | (data[0] as u64) <<  0;
		Ok(val)
	}
}

pub trait WriteIntsLittleEndian : std::io::Write {
	fn write_u16(&mut self, val: u16) -> std::io::Result<()> {
		let data = [(val >>  0) as u8, (val >>  8) as u8];
		self.write_all(&data)
	}

	fn write_u32(&mut self, val: u32) -> std::io::Result<()> {
		let data = [(val >>  0) as u8, (val >>  8) as u8,
		            (val >> 16) as u8, (val >> 24) as u8];
		self.write_all(&data)
	}

	fn write_u64(&mut self, val: u64) -> std::io::Result<()> {
		let data = [(val >>  0) as u8, (val >>  8) as u8,
		            (val >> 16) as u8, (val >> 24) as u8,
		            (val >> 32) as u8, (val >> 40) as u8,
		            (val >> 48) as u8, (val >> 56) as u8];
		self.write_all(&data)
	}
}
