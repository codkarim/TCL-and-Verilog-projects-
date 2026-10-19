vlib work
vlog *.*v
vsim -voptargs=+acc work.Door_Controller_TB
do wave.do
run -all