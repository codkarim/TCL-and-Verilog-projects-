onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {control} /Door_Controller_TB/RST_TB
add wave -noupdate -expand -group {control} /Door_Controller_TB/CLK_TB
add wave -noupdate -expand -group {input} -color Gold /Door_Controller_TB/UP_max_TB
add wave -noupdate -expand -group {input} -color Gold /Door_Controller_TB/activate_TB
add wave -noupdate -expand -group {input} -color Gold /Door_Controller_TB/DN_max_TB
add wave -noupdate -expand -group {output} -color {Blue Violet} /Door_Controller_TB/outputs
add wave -noupdate -expand -group {output} -color {Blue Violet} /Door_Controller_TB/UP_M_TB
add wave -noupdate -expand -group {output} -color {Blue Violet} /Door_Controller_TB/DN_M_TB
add wave -noupdate -expand -group {States} /Door_Controller_TB/DUT/current
add wave -noupdate -expand -group {States} /Door_Controller_TB/DUT/next
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {108744 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {67328 ps} {201984 ps}
