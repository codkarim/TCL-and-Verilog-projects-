onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group control /CRC_TB/RST_TB
add wave -noupdate -expand -group control /CRC_TB/CLK_TB
add wave -noupdate -expand -group {input
} -radix hexadecimal /CRC_TB/do_oper/DATA_IN
add wave -noupdate -expand -group {input
} -color Gold /CRC_TB/DATA_TB
add wave -noupdate -expand -group {input
} -color Gold /CRC_TB/ACTIVE_TB
add wave -noupdate -expand -group {input
} -color Gold /CRC_TB/DUT/R
add wave -noupdate -expand -group output /CRC_TB/VALID_TB
add wave -noupdate -expand -group output /CRC_TB/CRC_TB
add wave -noupdate -expand -group count /CRC_TB/DUT/high
add wave -noupdate -expand -group count -radix unsigned /CRC_TB/DUT/counter
add wave -noupdate -expand -group check -color {Blue Violet} -radix hexadecimal /CRC_TB/DATA_SERIAL
add wave -noupdate -expand -group check -color {Blue Violet} -radix hexadecimal -childformat {{{/CRC_TB/expec_out[9]} -radix hexadecimal} {{/CRC_TB/expec_out[8]} -radix hexadecimal} {{/CRC_TB/expec_out[7]} -radix hexadecimal} {{/CRC_TB/expec_out[6]} -radix hexadecimal} {{/CRC_TB/expec_out[5]} -radix hexadecimal} {{/CRC_TB/expec_out[4]} -radix hexadecimal} {{/CRC_TB/expec_out[3]} -radix hexadecimal} {{/CRC_TB/expec_out[2]} -radix hexadecimal} {{/CRC_TB/expec_out[1]} -radix hexadecimal} {{/CRC_TB/expec_out[0]} -radix hexadecimal}} -subitemconfig {{/CRC_TB/expec_out[9]} {-color {Blue Violet} -height 15 -radix hexadecimal} {/CRC_TB/expec_out[8]} {-color {Blue Violet} -height 15 -radix hexadecimal} {/CRC_TB/expec_out[7]} {-color {Blue Violet} -height 15 -radix hexadecimal} {/CRC_TB/expec_out[6]} {-color {Blue Violet} -height 15 -radix hexadecimal} {/CRC_TB/expec_out[5]} {-color {Blue Violet} -height 15 -radix hexadecimal} {/CRC_TB/expec_out[4]} {-color {Blue Violet} -height 15 -radix hexadecimal} {/CRC_TB/expec_out[3]} {-color {Blue Violet} -height 15 -radix hexadecimal} {/CRC_TB/expec_out[2]} {-color {Blue Violet} -height 15 -radix hexadecimal} {/CRC_TB/expec_out[1]} {-color {Blue Violet} -height 15 -radix hexadecimal} {/CRC_TB/expec_out[0]} {-color {Blue Violet} -height 15 -radix hexadecimal}} /CRC_TB/expec_out
add wave -noupdate -expand -group check -color {Blue Violet} -radix hexadecimal /CRC_TB/check_out/gener_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2280990 ps} 0}
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
WaveRestoreZoom {2819380 ps} {3843380 ps}
