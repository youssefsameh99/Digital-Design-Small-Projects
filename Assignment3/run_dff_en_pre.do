vlib work
vlog DFF_with_enable.v DFF_with_enable_tb.v
vsim -voptargs=+acc work.dff_en_pre_tb
add wave *
run -all
#quit -sim