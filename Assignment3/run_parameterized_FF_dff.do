vlib work
vlog DFF.v parameterized_FF_dff_tb.v parameterized_FF_tff_tb.v TFF.v parameterized_FF.v
vsim -voptargs=+acc work.parameterized_DFF_tb
add wave *
run -all
#quit -sim