vlog alu.svh
vsim -sv_seed 2 alu_top 
run -all
mv transcript output2.log
q -sim
q
