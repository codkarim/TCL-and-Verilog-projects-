vlib work
vlog *.v
vsim -voptargs=+acc work.CRC_TB
do wave.do
run -all