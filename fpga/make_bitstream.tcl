source block_design.tcl

# call implement
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

# move and rename bitstream to final location
file copy -force ./ekiwi/ekiwi.runs/impl_1/system_wrapper.bit system.bit
