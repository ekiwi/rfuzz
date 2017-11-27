use std::collections::VecDeque;
use std::fmt::Debug;
use super::TestId;
use super::buffered::BufferSlot;
use super::super::mutation::{ MutationInfo, MutationAlgorithmId, MutationId };

trait IntervalProperty {
	type ChapterT : PartialEq + Debug;
	type IndexT : Default + PartialEq + Debug;
	fn is_direct_succession(old: &Self::IndexT, next: &Self::IndexT) -> bool;
	fn from_interval(chapter: Self::ChapterT, start: u64, pos: u64) -> Self;
	fn get_offset(ii: &Self::IndexT) -> u64;
	fn chapter(&self) -> Self::ChapterT;
	fn index(&self) -> Self::IndexT;
}

#[derive(Clone)]
struct TestInterval<T: IntervalProperty> { start: TestId, stop: TestId, chapter: T::ChapterT }
impl <T: IntervalProperty> TestInterval<T> {
	fn is_older_than(&self, test: TestId) -> bool { test > self.stop }
	fn contains(&self, test: TestId) -> bool { test >= self.start && test <= self.stop }
	fn get_info(&self, test: TestId) -> Option<T> {
		if self.contains(test) {
			Some(T::from_interval(self.chapter, self.start.0, test.0))
		} else { None }
	}
	fn get_id(&self, prop: &T) -> Option<TestId> {
		if self.chapter != prop.chapter() { None } else {
			let id = TestId(self.start.0 + T::get_offset(&prop.index()));
			assert!(self.contains(id));
			Some(id)
		}
	}
}

struct History<T: IntervalProperty> {
	log: VecDeque<TestInterval<T>>,
	active_chapter: Option<T::ChapterT>,
	last_index: T::IndexT,
	start: TestId,
}
impl <T: IntervalProperty> History<T> {
	fn new() -> Self {
		History { log: VecDeque::new(), active_chapter: None,
		          last_index: T::IndexT::default(),
		          start: TestId::default() }
	}
	fn new_test(&mut self, prop: &T, last_id: TestId) {
		if self.active_chapter == Some(prop.chapter()) {
			assert!(T::is_direct_succession(&self.last_index, &prop.index()),
				"tests must be consecutive");
		} else {
			// remember previous if it existed
			if let Some(chapter) = self.active_chapter {
				let start = self.start;
				let stop = last_id;
				self.log.push_back(TestInterval{ start, stop, chapter });
			}
			// store new algo and reset mutation count
			self.active_chapter = Some(prop.chapter());
			assert_eq!(prop.index(), T::IndexT::default(),
			"we expect new chapters to start at the default index!");
			self.start = last_id.next();
		}
		self.last_index = prop.index();
	}
	fn get_info(&mut self, id: TestId, last_id: TestId) -> T {
		while self.log.len() > 0 {
			let oldest = self.log.front().unwrap().clone();
			if let Some(info) = oldest.get_info(id) {
				return info;
			} else {
				assert!(oldest.is_older_than(id), "we lost information, probably out of order test!");
				self.log.pop_front();
			}
		}
		assert!(id <= last_id, "cannot handle tests from the future!");
		T::from_interval(self.active_chapter.unwrap(), self.start.0, id.0)
	}
	fn get_test_id(&mut self, prop: &T, last_id: TestId) -> TestId {
		while self.log.len() > 0 {
			let oldest = self.log.front().unwrap().clone();
			if let Some(id) = oldest.get_id(prop) {
				return id
			} else {
				self.log.pop_front();
			}
		}
		assert_eq!(prop.chapter(), self.active_chapter.unwrap(), "failed to find chapter!");
		let id = TestId(self.start.0 + T::get_offset(&prop.index()));
		assert!(id <= last_id, "cannot handle tests from the future!");
		id
	}
}

impl IntervalProperty for MutationInfo {
	type ChapterT = MutationAlgorithmId;
	type IndexT = MutationId;
	fn from_interval(chapter: Self::ChapterT, start: u64, pos: u64) -> Self {
		let id = MutationId::from_integer_interval(start, pos);
		MutationInfo { mutation_algo: chapter, mutation_id: id }
	}
	fn get_offset(ii: &Self::IndexT) -> u64 { ii.get_offset() }
	fn chapter(&self) -> Self::ChapterT { self.mutation_algo }
	fn index(&self) -> Self::IndexT { self.mutation_id }
	fn is_direct_succession(old: &Self::IndexT, next: &Self::IndexT) -> bool {
		old.is_predecessor(next)
	}
}

impl IntervalProperty for BufferSlot {
	type ChapterT = u32;
	type IndexT = u16;
	fn from_interval(chapter: Self::ChapterT, start: u64, pos: u64) -> Self {
		let offset = (pos - start) as u16;
		BufferSlot { id: chapter, offset }
	}
	fn get_offset(ii: &Self::IndexT) -> u64 { *ii as u64 }
	fn chapter(&self) -> Self::ChapterT { self.id }
	fn index(&self) -> Self::IndexT { self.offset }
	fn is_direct_succession(old: &Self::IndexT, next: &Self::IndexT) -> bool {
		*old + 1 == *next
	}
}


pub struct TestHistory {
	mutation: History<MutationInfo>,
	buffer: History<BufferSlot>,
	test_id: TestId,
}
impl TestHistory {
	pub fn new() -> Self {
		TestHistory { mutation: History::new(), buffer: History::new(),
		              test_id: TestId::default() }
	}
	pub fn new_test(&mut self, info: &MutationInfo, slot: &BufferSlot) -> TestId {
		self.mutation.new_test(info, self.test_id);
		self.buffer.new_test(slot, self.test_id);
		self.test_id = self.test_id.next();
		self.test_id
	}
	pub fn get_mutation_info(&mut self, id: TestId) -> MutationInfo {
		self.mutation.get_info(id, self.test_id)
	}
	pub fn get_buffer_slot(&mut self, id: TestId) -> BufferSlot {
		self.buffer.get_info(id, self.test_id)
	}
	pub fn get_id_for_slot(&mut self, slot: BufferSlot) -> TestId {
		self.buffer.get_test_id(&slot, self.test_id)
	}
}

