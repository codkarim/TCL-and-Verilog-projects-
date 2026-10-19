puts "#########lab1.0#########"
puts "This is My First Script"
set var0 25
set var1 50
set var2 [expr 2 * $var1]
puts "The Value of Var0 is $var0"
puts "The Value of Var1 is $var1"
puts "The Value of Var2 is $var2"
puts {The Value of Var2 is $var2}
puts "The Value of Var2 is \$var2"

puts "#########lab1.1#########"
puts "****Arthimetic Operation on Integer Operands****"
set 	A 		35
set	 	B   	80

set     var00   [expr $A + $B]
set     var01   [expr $A - $B]
set     var02   [expr $A * $B]
set     var03   [expr $A / $B]
set     var04   [expr $A % $B]

puts " A + B = $var00"
puts " A - B = $var01"
puts " A * B = $var02"
puts " A / B = $var03"
puts " A % B = $var04"

puts "****Arthimetic Operation on floating Operands****"
set 	C 		35.0
set	 	D   	80

set     var05   [expr $C + $D]
set     var06   [expr $C - $D]
set     var07   [expr $C * $D]
set     var08   [expr $C / $D]
#set     var09   [expr $C % $D]

puts " C + D = $var05"
puts " C - D = $var06"
puts " C * D = $var07"
puts " C / D = $var08"
#puts " C % D = $var09"

puts "#########lab1.2#########"
puts "****String Manipulation Lab****"
set str1 MahmoudAhmed@gmail.com
set str2 MostafaAli@hotmail.com

puts "the index of @ is : [string first @ $str1]" 
puts "the uppercase of str1 is : [string toupper [string range $str1 0 11]]"

puts "the length of str1 is : [string length $str1]"
puts "Domain name of str2 is : [string range  $str2 11 17]"

set  str3 [string range $str1 0 12]
puts "the new mail address is : [append  str3 {hotmail.com}]"

if {[string match *gmail* $str1]} {
puts "it is a gmail account"
} else {
puts "it is not a gmail account"
}  


