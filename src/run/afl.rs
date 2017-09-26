extern crate libc;

use std;
use std::ffi::{CString};

use super::{CoverageMap, Fault};

// from `afl/config.h`
const SHM_ENV_VAR: &'static str = "__AFL_SHM_ID";
const FORKSRV_FD: i32 = 198;
const EXEC_FAIL_SIG: u32 = 0xfee1dead;

fn setenv(name: &str, value: &str, overwrite: bool) {
	unsafe {
		libc::setenv(CString::new(name).unwrap().as_ptr(),
		             CString::new(value).unwrap().as_ptr(), overwrite as i32)
	};
}

fn is_in_env(name: &str) -> bool {
	let val = unsafe { libc::getenv(CString::new(name).unwrap().as_ptr()) };
	val != std::ptr::null_mut()
}

fn setrlimit(resource: i32, cur: u64, max: u64) -> Option<()> {
	let limits = libc::rlimit{ rlim_cur: cur, rlim_max: max };
	match unsafe { libc::setrlimit(resource, &limits) } {
		0 => Some(()),
		_ => None
	}
}

fn open(pathname: &str, flags: i32) -> Option<i32> {
	let fd = unsafe {
		libc::open(CString::new(pathname).unwrap().as_ptr(), flags)
	};
	if fd < 0 { None } else { Some(fd) }
}


fn close(fd: i32) -> Option<()> {
	match unsafe { libc::close(fd) } {
		0 => Some(()),
		_ => None
	}
}

fn duplicate_fd(oldfd: i32, newfd: i32) -> Option<i32> {
	let fd = unsafe { libc::dup2(oldfd, newfd) };
	if fd < 0 { None } else { Some(fd) }
}

struct SharedMemory {
	data: *mut libc::c_void,
	size: usize,
	id: i32
}

impl SharedMemory {
	fn create(size: usize) -> SharedMemory {
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

	fn reset(&self) {
		unsafe { libc::memset(self.data, 0, self.size) };
	}

	fn as_slice_u32_mut(&self) -> &mut [u32] {
		unsafe { std::slice::from_raw_parts_mut(self.data as *mut u32, self.size / 4) }
	}
}

impl super::CoverageMap for SharedMemory {
	fn as_slice_u8(&self) -> &[u8] {
		unsafe { std::slice::from_raw_parts(self.data as *mut u8, self.size) }
	}
	fn as_slice_u16(&self) -> &[u16] {
		unsafe { std::slice::from_raw_parts(self.data as *mut u16, self.size / 2) }
	}
}

impl Drop for SharedMemory {
	fn drop(&mut self) {
		// println!("SharedMemory.drop: {}", self.id);
		unsafe { libc::shmctl(self.id, libc::IPC_RMID, std::ptr::null_mut()) };
	}
}

pub struct ForkServerConfiguration<'a> {
	pub argv: &'a[&'a str],
	pub map_size: usize,
	pub mem_limit: usize,
	/// set to 0 if you do not want to fuzz stdin
	pub stdin_fd: i32
}


struct ForkServer {
	control_pipe: i32,
	status_pipe: i32,
	trace_bits: SharedMemory,
	prev_timed_out: u32
}

impl ForkServer {
	// TODO: more rusty argument
	fn create(cfg: &ForkServerConfiguration) -> ForkServer {
		let control_fd = FORKSRV_FD;
		let status_fd  = FORKSRV_FD + 1;
		// println!("ForkServer.create");

		// basic sanity check
		assert!(cfg.argv.len() > 0);

		// create trace bits shared memory region
		let trace_bits = SharedMemory::create(cfg.map_size);
		trace_bits.reset();

		// set environment variable to inject shared memory id into fork server
		setenv(SHM_ENV_VAR, trace_bits.id.to_string().as_str(), true);


		// create pipes to communicate with fork server
		let mut status_pipe:  [i32; 2] = [0,0];
		assert!(unsafe { libc::pipe(status_pipe.as_mut_ptr())  } == 0);
		let mut control_pipe: [i32; 2] = [0,0];
		assert!(unsafe { libc::pipe(control_pipe.as_mut_ptr()) } == 0);

		let pid = unsafe { libc::fork() };
		assert!(pid >= 0);
		let is_child = pid == 0;

		if is_child {
			// convert argv to be C compatible
			let mut argv_vec = Vec::with_capacity(cfg.argv.len() + 1);
			// the following array list is needed in order to keep the
			// raw C strings from getting deallocated to early
			let mut keep_strings_alive = Vec::with_capacity(cfg.argv.len());
			for arg in cfg.argv {
				keep_strings_alive.push(CString::new(*arg).unwrap());
				argv_vec.push(keep_strings_alive.last().unwrap().as_ptr());
			}
			argv_vec.push(std::ptr::null());
			let prog = argv_vec[0];
			let argv = argv_vec.as_slice().as_ptr();

			// set upper bound for virtual memory
			setrlimit(libc::RLIMIT_AS, cfg.mem_limit as u64,
			                           cfg.mem_limit as u64).unwrap();
			// disable core dump files
			setrlimit(libc::RLIMIT_CORE, 0, 0).unwrap();
			// create new session
			if unsafe { libc::setsid() } == -1 {
				panic!("setsid failed: {:?}", std::io::Error::last_os_error());
			}

			// disable output
			let dev_null_fd = open("/dev/null", libc::O_RDWR).unwrap();
			duplicate_fd(dev_null_fd, libc::STDOUT_FILENO).unwrap();
			duplicate_fd(dev_null_fd, libc::STDERR_FILENO).unwrap();
			if cfg.stdin_fd > 0 {
				duplicate_fd(cfg.stdin_fd, libc::STDIN_FILENO).unwrap();
				close(cfg.stdin_fd).unwrap();
			} else {
				duplicate_fd(dev_null_fd, libc::STDIN_FILENO).unwrap();
			}

			// wire control and status pipe to default fds
			duplicate_fd(control_pipe[0], control_fd);    // read
			duplicate_fd(status_pipe[1],  status_fd);     // write

			// close fds that are no longer needed
			close(control_pipe[0]).unwrap();
			close(control_pipe[1]).unwrap();
			close(status_pipe[0]).unwrap();
			close(status_pipe[1]).unwrap();
			close(dev_null_fd).unwrap();

			// tell linker to load shared objects on startup
			if !is_in_env("LD_BIND_LAZY") {
				setenv("LD_BIND_NOW", "1", false);
			}

			// TODO: set ASAN_OPTIONS and MSAN_OPTIONS

			// load forkserver process
			unsafe { libc::execv(prog, argv) };

			// we will only get here if the execv failed -> notify client
			trace_bits.as_slice_u32_mut()[0] = EXEC_FAIL_SIG;
			std::process::exit(0);
		}

		// if we get here, we are the parent process!

		// close the child's end of the pipes
		close(control_pipe[0]).unwrap();    // read
		close(status_pipe[1]).unwrap();     // write

		// create fork server struct so that we can use the communication functions
		let server = ForkServer {
			control_pipe: control_pipe[1],  // write
			status_pipe: status_pipe[0],    // read
			trace_bits: trace_bits,
			prev_timed_out: 0 };

		// try to communicate with server
		if server.read_status() == None {
			if server.trace_bits.as_slice_u32_mut()[0] == EXEC_FAIL_SIG {
				panic!("failed to execute binary");
			}
			panic!("failed to communicate with the fork server");
		}

		// done
		server
	}

	fn read_status(&self) -> Option<u32> {
		let mut status: [u32; 1] = [0];
		match unsafe { libc::read(self.status_pipe,
			                      status.as_mut_ptr() as *mut libc::c_void, 4)
			} {
			4 => Some(status[0]),
			_ => None
		}
	}

	fn write_control(&self, control: u32) -> Option<()> {
		let buf: [u32; 1] = [control];
		match unsafe { libc::write(self.control_pipe,
			                       buf.as_ptr() as *const libc::c_void, 4)
			} {
			4 => Some(()),
			_ => None
		}
	}

	fn run_target(&self) -> Fault {
		self.trace_bits.reset();
		std::sync::atomic::fence(std::sync::atomic::Ordering::SeqCst);

		self.write_control(self.prev_timed_out).unwrap();
		let child_pid = self.read_status().unwrap();
		assert!(child_pid > 0);
		let status = self.read_status().unwrap() as i32;

		std::sync::atomic::fence(std::sync::atomic::Ordering::SeqCst);
		// TODO: classify_counts

		// determine how the program was stopped
		// TODO: use timeout to find hangs
		if unsafe { libc::WIFSIGNALED(status) } {
			Fault::Crash{ signal: unsafe { libc::WTERMSIG(status) } }
		} else {
			Fault::None
		}
	}
}

impl Drop for ForkServer {
	fn drop(&mut self) {
		// println!("ForkServer.drop");
		close(self.control_pipe).unwrap();
		close(self.status_pipe).unwrap();
		// TODO: actually kill the forkserver
	}
}


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


pub struct AflConfig<'a> {
	pub argv: &'a[&'a str],
	pub map_size: usize,
	pub mem_limit: usize,
}

pub struct AflRunner {
	fuzz_fd : i32,
	client: ForkServer
}

impl AflRunner {
	pub fn create(cfg: &AflConfig) -> AflRunner {
		// create fuzz input file
		// unsafe { libc::unlink(CString::new("cur_input").unwrap().as_ptr()) };
		let fuzz_fd = open_mode("cur_input",
			                    libc::O_RDWR | libc::O_CREAT | libc::O_EXCL,
			                    0o600).expect("failed to create cur_input");
		assert!(fuzz_fd >= 0);

		let cfg = ForkServerConfiguration {
			argv: cfg.argv, map_size: cfg.map_size,
			mem_limit: cfg.mem_limit, stdin_fd: fuzz_fd };
		let client = ForkServer::create(&cfg);

		AflRunner { fuzz_fd : fuzz_fd, client : client }
	}
}

impl Drop for AflRunner {
	fn drop(&mut self) {
		close(self.fuzz_fd).unwrap();
		unsafe { libc::unlink(CString::new("cur_input").unwrap().as_ptr()) };
	}
}

impl super::TestRunner for AflRunner {
	fn run(&self, input: &[u8]) -> Fault {
		// write fuzz stuff, TODO: move to function
		unsafe { libc::lseek(self.fuzz_fd, 0, libc::SEEK_SET) };
		short_write(self.fuzz_fd, input).unwrap();
		unsafe { libc::ftruncate(self.fuzz_fd, input.len() as i64) };
		unsafe { libc::lseek(self.fuzz_fd, 0, libc::SEEK_SET) };
		let fault = self.client.run_target();
		fault
	}
	fn coverage(&self) -> &CoverageMap {
		&self.client.trace_bits
	}
}
