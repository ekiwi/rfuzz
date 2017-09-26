// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at:
// http://www.apache.org/licenses/LICENSE-2.0

#ifndef AFL_H
#define AFL_H

#include <stdint.h>

/// call at the beginning of main to start fork server
void afl_init();

extern uint8_t* __afl_area_ptr;
static inline void afl_increment(uint16_t id)
{ __afl_area_ptr[id]++; }
static inline void afl_set(uint16_t id, uint8_t value)
{ __afl_area_ptr[id] = value; }
static inline uint8_t afl_get(uint16_t id)
{ return __afl_area_ptr[id]; }

#endif // AFL_H
