puts "#########lab2.0#########"
puts "****List Operations Lab****"
set lst0 [list Jan Mar April May]
set lst1 {June July August}
puts "list0 elemnts  : $lst0"
puts "list1 elemnts  : $lst1"
puts "Length of lst0 : [llength $lst0]"
puts "Third item of lst1 : [lindex $lst1 2]"
puts "Length of lst0 : [llength $lst0]"
# to check lst1 not existed
if {[lsearch $lst1 oct] != -1} {
puts "oct is existed"
} else {
puts "oct is not existed"
}
set lst0_insert [linsert $lst0 1 Feb]
puts "new list0 is :$lst0_insert"
puts "new list1 is :[lappend lst1 Sep Oct Nov Dec]"
set list2 [concat $lst0_insert $lst1]
puts "the full list is : $list2"
puts "[llength $list2]"
puts "[lrange $list2 0 11]"
puts "[join $list2 " , "]"
for {set a 0} {$a < [llength $lst0_insert]} {incr a} {
puts "[string toupper [lindex $lst0_insert $a]]" 
}

foreach list1_upper $lst1 {
puts "[string tolower $list1_upper]"
}