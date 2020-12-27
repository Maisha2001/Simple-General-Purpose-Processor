onerror {quit -f}
vlib work
vlog -work work Components.vo
vlog -work work Components.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.problem_set3_schematic_vlg_vec_tst
vcd file -direction Components.msim.vcd
vcd add -internal problem_set3_schematic_vlg_vec_tst/*
vcd add -internal problem_set3_schematic_vlg_vec_tst/i1/*
add wave /*
run -all
