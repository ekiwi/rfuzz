// See LICENSE for license details.

package pynq

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class QueueUnitTester(queue: Queue, val depth: Int) extends PeekPokeTester(queue) {
	private val q = queue

	// define all inputs
	poke(q.io.push_back, false)
	poke(q.io.pop_front, false)
	poke(q.io.in, 0)
	// check reset state
	expect(q.io.full, depth == 0)
	expect(q.io.empty, depth > 0)
	expect(q.io.len, 0)
	step(1)

	// push one thing
	expect(q.io.full, false)
	expect(q.io.empty, true)
	expect(q.io.len, 0)
	poke(q.io.in, 0x19)
	poke(q.io.push_back, true)
	step(1)
	poke(q.io.push_back, false)
	expect(q.io.full, false)
	expect(q.io.empty, false)
	expect(q.io.len, 1)
	expect(q.io.out, 0x19)
	poke(q.io.pop_front, true)
	step(1)
	poke(q.io.pop_front, false)
	expect(q.io.full, false)
	expect(q.io.empty, true)
	expect(q.io.len, 0)

	// push all the things
	poke(q.io.push_back, true)
	for ( ii <- 1 to depth ) {
		expect(q.io.full, false)
		poke(q.io.in, ii)
		step(1)
		expect(q.io.len, ii)
	}
	poke(q.io.push_back, false)
	expect(q.io.full, true)
	expect(q.io.out, 1)

	// dummy cycle
	step(1)

	// additional pushes should be ignored
	poke(q.io.push_back, true)
	for ( ii <- 1 to 10 ) {
		expect(q.io.full, true)
		step(1)
	}
	poke(q.io.push_back, false)

	// pop all the things
	poke(q.io.pop_front, true)
	for ( ii <- 1 to depth ) {
		expect(q.io.empty, false)
		expect(q.io.out, ii)
		step(1)
		expect(q.io.len, depth - ii)
		expect(q.io.full, false)
	}
	poke(q.io.pop_front, false)
	expect(q.io.full, false)
	expect(q.io.empty, true)
	expect(q.io.len, 0)

	// additional pops should be ignored
	poke(q.io.pop_front, true)
	for ( ii <- 1 to 10 ) {
		expect(q.io.empty, true)
		step(1)
	}
	poke(q.io.pop_front, false)

	// push and pop active
	poke(q.io.push_back, true)
	poke(q.io.pop_front, true)
	poke(q.io.in, 123)
	expect(q.io.empty, true)
	step(1)
	expect(q.io.empty, false)
	expect(q.io.len, 1)
	for ( ii <- 1 to 10 ) {
		step(1)
		expect(q.io.len, 1)
	}
	poke(q.io.push_back, false)
	step(1)
	expect(q.io.empty, true)
}

class GCDTester extends ChiselFlatSpec {
	private val backendNames =
		if(firrtl.FileUtils.isCommandAvailable("verilator")) {
			Array("firrtl", "verilator") } else { Array("firrtl") }

	for ( backendName <- backendNames ) {
		"Queue" should s"behave like a bounded queue (with $backendName)" in {
			Driver(() => new Queue(4, 8), backendName) {
				queue => new QueueUnitTester(queue, 4)
			} should be (true)
		}
	}
}
