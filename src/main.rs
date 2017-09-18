extern crate libc;
extern crate time;
mod forkclient;

use std::env;
use std::ffi::{CString};
use forkclient::{ForkServer, ForkServerConfiguration};
use forkclient::{MAP_SIZE, MEM_LIMIT, FORKSRV_FD};

fn open_mode(pathname: &str, flags: i32, mode: i32) -> Option<i32> {
	let fd = unsafe {
		libc::open(CString::new(pathname).unwrap().as_ptr(), flags, mode)
	};
	if fd < 0 { None } else { Some(fd) }
}

fn short_write(fd: i32, data: &[u8]) -> Option<()> {
	let len = unsafe {
		libc::write(fd, data.as_ptr() as *const libc::c_void, data.len())
	};
	if len == data.len() as isize { Some(()) } else { None }
}

fn main() {
	println!("{}", env::args().nth(0).unwrap());

	// TODO: extract from command line args
	let argv = &["./minigzip", "-d"];
	let input = b"\x00\x00\x00\x00\x00\x00\x00\x00";
	//let input = b"\x1f\x8b\x08\xfb";

	// create fuzz input file
	unsafe { libc::unlink(CString::new("cur_input").unwrap().as_ptr()) };
	let fuzz_fd = open_mode("cur_input",
	                        libc::O_RDWR | libc::O_CREAT | libc::O_EXCL,
	                        0o600).unwrap();
	assert!(fuzz_fd >= 0);

	let cfg = ForkServerConfiguration {
		argv: argv,
		map_size:  MAP_SIZE,
		mem_limit: MEM_LIMIT,
		stdin_fd: fuzz_fd,
		control_fd: FORKSRV_FD,
		status_fd: FORKSRV_FD + 1
	};
	let svr = ForkServer::create(&cfg);

	let runs = 1000 as i64;
	println!("running {} {} times with the same input...", argv[0], runs);
	let start = time::PreciseTime::now();
	for _ in 0..runs {
		// write fuzz stuff, TODO: move to function
		unsafe { libc::lseek(fuzz_fd, 0, libc::SEEK_SET) };
		short_write(fuzz_fd, input).unwrap();
		unsafe { libc::ftruncate(fuzz_fd, input.len() as i64) };
		unsafe { libc::lseek(fuzz_fd, 0, libc::SEEK_SET) };

		svr.run_target();
	}
	let duration = start.to(time::PreciseTime::now());
	let runs_per_second = (runs * 1000 * 1000) as f64 / duration.num_microseconds().unwrap() as f64;
	println!("{:.1} runs/s", runs_per_second);

	println!("print logged basic block ids");
	for id in svr.trace_bits.as_slice_u16() {
		if *id == 0 {
			println!("exit");
			break;
		}
		println!("bb: {}", id);
	}
}
