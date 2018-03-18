// Copyright 2018, University of California, Berkeley
// author: Kevin Laeufer <laeufer@cs.berkeley.edu>

// This file contains a struct to collect various statistics about the
// fuzzing run.

use mutation::{MutatorId};
use std::default::Default;
use std::time::Duration;



#[derive(Serialize,Deserialize)]
pub struct GlobalSnapshot {
	mutators: Vec<MutatorSnapshot>,
	// tests_per_second: AverageRatioSnapshot<f64>,
	// cycles_per_test: AverageRatioSnapshot<f64>,
	// cycles_per_second: AverageRatioSnapshot<f64>
	tests_per_second: AverageRatioSnapshot,
	cycles_per_test: AverageRatioSnapshot,
	cycles_per_second: AverageRatioSnapshot
}

#[derive(Serialize,Deserialize)]
pub struct MutatorSnapshot {
	name: String,
	id: MutatorId,
	test_count: u64,
	// tests_per_second: AverageRatioSnapshot<f64>,
	tests_per_second: AverageRatioSnapshot,
}

////////////////////////////////////////////////////////////////////////////////
// Mutator Statistics

struct MutatorStats {
	name: String,
	id: MutatorId,
	test_count: u64,
	discovery_count: u64,
	last_discovery_at: Duration,
	// tests_per_second: AverageRatio<f64>,
	tests_per_second: AverageRatio,
}

impl MutatorStats {
	fn new(name: String, id: MutatorId) -> Self {
		MutatorStats {
			name, id,
			test_count: 0,
			discovery_count: 0,
			last_discovery_at: Duration::default(),
			tests_per_second: AverageRatio::default(),
		}
	}

	fn take_snapshot(&self) -> MutatorSnapshot {
		MutatorSnapshot {
			name: self.name.clone(), id: self.id,
			test_count: self.test_count,
			tests_per_second: self.tests_per_second.take_snapshot()
		}
	}

	fn update_test_count(&mut self, runs: u64, seconds: f64) {
		self.test_count += runs;
		self.tests_per_second.update(runs as f64, seconds);
	}

	fn update_new_discovery(&mut self, ts: Duration) {
		self.discovery_count += 1;
		self.last_discovery_at = ts;
	}
}

////////////////////////////////////////////////////////////////////////////////
// Global Statistics

struct GlobalStats {
	mutators: Vec<MutatorStats>,
	// tests_per_second: AverageRatio<f64>,
	// cycles_per_test: AverageRatio<f64>,
	// cycles_per_second: AverageRatio<f64>
	tests_per_second: AverageRatio,
	cycles_per_test: AverageRatio,
	cycles_per_second: AverageRatio
}

impl GlobalStats {
	fn new(mutator_info: Vec<(String, MutatorId)>) -> Self {
		let mutators = mutator_info.into_iter()
			.map(|ii| MutatorStats::new(ii.0, ii.1)).collect();

		GlobalStats {
			mutators,
			tests_per_second:  AverageRatio::default(),
			cycles_per_test:   AverageRatio::default(),
			cycles_per_second: AverageRatio::default(),
		}
	}

	fn take_snapshot(&self) -> GlobalSnapshot {
		let mutators = self.mutators.iter()
			.map(|m| m.take_snapshot()).collect();
		GlobalSnapshot {
			mutators,
			tests_per_second:  self.tests_per_second.take_snapshot(),
			cycles_per_test:   self.cycles_per_test.take_snapshot(),
			cycles_per_second: self.cycles_per_second.take_snapshot(),
		}
	}

	fn update_test_count(&mut self, mutator_id: MutatorId, runs: u64, cycles: u64, seconds: f64) {
		assert_eq!(self.mutators.iter_mut()
			.filter(|m| m.id == mutator_id).take(1)
			.map(|m| m.update_test_count(runs, seconds))
			.count(), 1);
		self.tests_per_second.update(runs as f64, seconds);
		self.cycles_per_test.update(cycles as f64, runs as f64);
		self.cycles_per_second.update(cycles as f64, seconds);
	}

	fn update_new_discovery(&mut self, mutator_id: MutatorId, ts: Duration) {
		assert_eq!(self.mutators.iter_mut()
			.filter(|m| m.id == mutator_id).take(1)
			.map(|m| m.update_new_discovery(ts))
			.count(), 1);
	}
}


////////////////////////////////////////////////////////////////////////////////
// AverageRatio

// used for things like tests/time or cycles/tests
// TODO: make generic over underlying type T (instead of hard coding for f64)

#[derive(Serialize,Deserialize)]
pub struct AverageRatioSnapshot {
	global: f64,
	global_numerator: f64,
	global_denominator: f64,
	local: f64,
	local_numerator: f64,
	local_denominator: f64,
}

#[derive(Default)]
struct AverageRatio {
	global_numerator: f64,
	global_denominator: f64,
	local_numerator: f64,
	local_denominator: f64,
}

impl AverageRatio {
	fn update(&mut self, d_num: f64, d_den: f64) {
		self.local_numerator = d_num;
		self.local_denominator = d_den;
		self.global_numerator += d_num;
		self.global_denominator += d_den;
	}
	fn local(&self) -> f64 { self.local_numerator / self.local_denominator }
	fn global(&self) -> f64 { self.global_numerator / self.global_denominator }
	fn take_snapshot(&self) -> AverageRatioSnapshot {
		AverageRatioSnapshot {
			global: self.global(),
			global_numerator: self.global_numerator,
			global_denominator: self.global_denominator,
			local: self.local(),
			local_numerator: self.local_numerator,
			local_denominator: self.local_denominator,
		}
	}
}