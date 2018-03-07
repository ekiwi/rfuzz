#include "simif_emul.h"
#include "rfuzz.h"

class rfuzz_emul_t:
  public simif_emul_t,
  public rfuzz_t { };

int main(int argc, char** argv)
{
  rfuzz_emul_t rfuzz;
  rfuzz.init(argc, argv, true);
  rfuzz.run();
  return rfuzz.finish();
}
