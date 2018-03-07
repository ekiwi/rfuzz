#include "simif_zynq.h"
#include "rfuzz.h"

class rfuzz_zynq_t:
  public simif_zynq_t,
  public rfuzz_t { };

int main(int argc, char** argv)
{
  rfuzz_zynq_t rfuzz;
  rfuzz.init(argc, argv, true);
  rfuzz.run();
  return rfuzz.finish();
}
