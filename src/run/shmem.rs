extern crate libc;

use std;

pub struct SharedMemory {
	data: *mut libc::c_void,
	size: usize,
	id: i32
}

impl SharedMemory {
	pub fn create(size: usize) -> SharedMemory {
		let shm_id = unsafe {
			libc::shmget(libc::IPC_PRIVATE, size,
						 libc::IPC_CREAT | libc::IPC_EXCL | 0o600)
			};
		assert!(shm_id >= 0);
		let data = unsafe { libc::shmat(shm_id, std::ptr::null_mut(), 0) };
		if data as i64 == -1 {
			panic!("failed to allocate shared memory: {:?}", std::io::Error::last_os_error());
		}
		// println!("SharedMemory.create: id={}, data={:?}", shm_id, data);
		SharedMemory { id: shm_id, size: size, data: data }
	}

	pub fn reset(&self) {
		unsafe { libc::memset(self.data, 0, self.size) };
	}

	pub fn as_slice_u32_mut(&self) -> &mut [u32] {
		unsafe { std::slice::from_raw_parts_mut(self.data as *mut u32, self.size / 4) }
	}

	pub fn id(&self) -> i32 { self.id }
}

impl Drop for SharedMemory {
	fn drop(&mut self) {
		// println!("SharedMemory.drop: {}", self.id);
		unsafe { libc::shmctl(self.id, libc::IPC_RMID, std::ptr::null_mut()) };
	}
}
