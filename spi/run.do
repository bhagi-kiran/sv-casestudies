vlog spi.svh
vsim tb 
#add wave -position insertpoint sim:/tb/_if/*
run -all
mv transcript output.log
q -sim
q -f
