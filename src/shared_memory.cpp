// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>

// C++ wrapper around the POSIX shared memory facilities
#include <shared_memory.hpp>
#include <sys/types.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <cassert>


SharedMemory::~SharedMemory() {
	if(id >= 0) {
		shmctl(id, IPC_RMID, NULL);
	}
}

SharedMemory
SharedMemory::alloc(size_t bytes) {
	const int32_t shm_id = shmget(IPC_PRIVATE, bytes, IPC_CREAT | IPC_EXCL | 0600);
	assert(shm_id >= 0);
	return SharedMemory::from_id(shm_id);
}


SharedMemory
SharedMemory::from_id(int32_t id) {
	auto data = shmat(id, NULL, 0);
	assert(data != nullptr);
	return SharedMemory(id, data);
}
