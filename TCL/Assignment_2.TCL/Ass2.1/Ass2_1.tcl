puts "****Writing Verilog Block Interface****"

set fh [open interface.txt w+]


set modname "Up_Dn_Counter"


set in_ports [list IN   \
				   Load \
				   Up \
				   Down \
				   CLK]
				   
set in_ports_width [list 4 1 1 1 1]


set out_ports [list High  \
				    Counter \
				    Low ]

set out_ports_width [list 1 4 1]


set size_in   [llength $in_ports]
set size_out  [llength $out_ports]


set name "module $modname ("
puts $fh "$name\n"

for {set loop1 0 }  {$loop1 < [llength $in_ports]} {incr loop1} {
	if {[lindex $in_ports_width $loop1] != 1} {
		set input1 "    input    \[[expr [lindex $in_ports_width $loop1] - 1]:0\]      [lindex  $in_ports   $loop1 ],"
		puts $fh "$input1"
	} else {
		set input2 "    input               [lindex  $in_ports   $loop1 ]," 
		puts $fh "$input2"
	}
}

for {set loop2 0 }  {$loop2 < [llength $out_ports]} {incr loop2} {
  if {$loop2 != [expr [llength $out_ports] -1]} {

    if {[lindex $out_ports_width $loop2] != 1} {
      set output1 "    output   \[[expr [lindex $out_ports_width $loop2] - 1]:0\] 	[lindex  $out_ports   $loop2 ],"
	  puts $fh "$output1"
    } else {
      set output2 "    output    	        [lindex  $out_ports   $loop2 ],"
	  puts $fh "$output2"
    }

    } else {
    if {[lindex $out_ports_width $loop2] != 1} {
      set output3 "    output   \[[expr [lindex $out_ports_width $loop2] - 1]:0\] 	[lindex  $out_ports   $loop2 ]"
	  puts $fh "$output3"
    } else {
      set output4 "    output    	        [lindex  $out_ports   $loop2 ]"
	  puts $fh "$output4"
    }  
  }
}

puts $fh  "    );"	
			   

close $fh 	
			   
puts "the result will appear in interface.txt"
puts "karim abomera"