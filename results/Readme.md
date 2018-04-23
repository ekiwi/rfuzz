# Results

This directory hold some preliminary results from various stages
of the development.

Please document the circumstances under which the results were
produced in this Readme.

## 4.jqf2.i2c

This is a run fuzzing the TLI2C circuit with the newly implemented
full JQF (level 2) with a separate coverage map.
The results look incredibly good, achieving 95% mux toggle coverage
compared to the 25% achieved by the base line (counting only valid inputs).
We will need to verify whether these results are credible...

Git SHA: ad844b0f15547fafbf08e0e3507b09ad24acb322

## 1.jqf2.i2c

We were able to reproduce the coverage from `4.jqf2.i2c` by fuzzing for an hour.
This time it took ~40min to reach the same coverage as the previous run achieved
in ~4min. However at least it seems reproducible.