puts "#########ASS2.0#########"
set fh  [open rtl.txt r+]
set file_data [read $fh]
set designs [list $file_data]

regsub -all {\n} $designs { } designs
#for deleting space from the last elemnt  
regsub -all {  } $designs {} designs
  
puts "$designs"
close $fh
puts "karim abomera"
