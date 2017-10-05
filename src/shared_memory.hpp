// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>

// C++ wrapper around the POSIX shared memory facilities

#ifndef SHARED_MEMORY_HPP
#define SHARED_MEMORY_HPP

#include <cstdint>
#include <cstddef>

class SharedMemory {
	const int32_t id;
	void* const data;
public:
	SharedMemory(int32_t id, void* data) : id(id), data(data) {}
	~SharedMemory();
	template<typename T>
	get_as<T>() { return static_cast<T>(data); }
public:
	static SharedMemory alloc(size_t bytes);
	static SharedMemory from_id(int32_t id);
};

#endif // SHARED_MEMORY_HPP
