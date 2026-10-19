puts "#########lab2.0#########"
puts "****File I/O & Regsub Lab****"

set fh  [open Interface.txt r+]
set file_data [read $fh]
set fh2 [open tb.txt w+]

#we use \ to escape new line(iam not sure)
set input [list IN \
				Load \
				Up \
				Down \
				CLK ]
				
set output [list High Counter Low]				

# x for loop on list elemnts
foreach x $input {
regsub "$x" $file_data "i_$x;" file_data
}


foreach y $output {
regsub -nocase "$y" $file_data "o_$y;" file_data
}


regsub -all "input" $file_data "reg"  file_data

regsub -all "output" $file_data "wire"  file_data


#the result doesnt appear on tclshell but in tb.txt
puts  $fh2 $file_data
puts "the result will appear in tb.txt"
close $fh
close $fh2
