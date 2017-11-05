package pynq

import chisel3._
import chisel3.util._

class Queue(val depth: Int, val width: Int) extends Module {
	val io = IO(new Bundle {
		val in   = Input(UInt(width.W))
		val out  = Output(UInt(width.W))
		val push_back = Input(Bool())
		val pop_front = Input(Bool())
		val full = Output(Bool())
		val empty = Output(Bool())
		val len = Output(UInt(log2Ceil(depth+1).W))
	})

	io.full := io.len === depth.U
	io.empty := io.len === 0.U

	val do_push = io.push_back && !io.full
	val do_pop  = io.pop_front && !io.empty

	val len = RegInit(0.U(log2Ceil(depth+1).W))
	io.len := len
	len := MuxCase(len, Seq(
		(do_push && !do_pop ) -> (len + 1.U),
		(do_pop  && !do_push) -> (len - 1.U)))

	val mem = Mem(depth, UInt(width.W))
	val max_address = (depth - 1).U
	def next_address(a: UInt): UInt = Mux(a === max_address, 0.U, a + 1.U)

	val read_address = RegInit(0.U(log2Ceil(depth).W))
	io.out := mem(read_address)
	read_address := Mux(do_pop, next_address(read_address), read_address)

	val write_address = RegInit(0.U(log2Ceil(depth).W))
	when(do_push) { mem(write_address) := io.in }
	write_address := Mux(do_push, next_address(write_address), write_address)
}
