puts "#########lab2.0#########"
puts "****Arrays & Procedures****"
# func in TCL TO CALCULATE average Gpa (is sum of values divided by no them )
proc Avg {Arr} {

# this command for using array in function (special case)
upvar $Arr x

#we want array size and array keys and initalize the sum with zero 
#we use x as array 
set length [array size x]
set keys   [array names x]
set sum 0

#we make a loop on keys and use values to CALCULATE average gpa
foreach loop $keys {
set sum [expr $sum + $x($loop)]
}

return [expr $sum / $length] 
}

#we dont use % because we will use numbers then in expr
array set Mohamed  {Waves 70 Electronics 85 Control 65 Comm 78}
array set Ahmed    {Waves 65 Electronics 80 Control 88 Comm 69}
array set Mostafa  {Waves 72 Electronics 77 Control 70 Comm 88}

#calculate the GPA of Mohamed
set Mohamed_GPA [Avg Mohamed]
puts "Mohamed Accumulative GPA is $Mohamed_GPA %"

#calculate the GPA of Mostafa
set Ahmed_GPA [Avg Ahmed]
puts "Ahmed Accumulative GPA is $Ahmed_GPA %"

#calculate the GPA of Ahmed
set Mostafa_GPA [Avg Mostafa]
puts "Mostafa Accumulative GPA is $Mostafa_GPA %"
