#include <fpga_queue.hpp>

#include "simif.h"

class rfuzz_t: virtual simif_t {
public:
  rfuzz_t() {
    fuzzer.init(PEEK_SIZE);
  }
  void run() {
    while (!fuzzer.done()) run_test();
  }

private:
  ActiveFuzzer fuzzer;

  inline void apply_input(const uint8_t* input) {
    // exclude reset
    for (size_t i = 0 ; i < POKE_SIZE-1 ; i++) {
      poke(i+1, input[i]);
    }
    fprintf(stderr, "[rfuzz] sent input\n");
  }

  inline void read_coverage(uint8_t* output) {
    for (size_t i = 0 ; i < PEEK_SIZE ; i++) {
      output[i] = peek(i);
    }
    fprintf(stderr, "[rfuzz] read coverage\n");
  }

  inline void run_test() {
    target_reset();
    uint8_t input[POKE_SIZE-1];
    while (fuzzer.pop(input, POKE_SIZE-1)) {
      apply_input(input);
      step(1);
    }
    step(1);
    uint8_t coverage[PEEK_SIZE];
    read_coverage(coverage);
    fuzzer.push(coverage, PEEK_SIZE);
  }
};
