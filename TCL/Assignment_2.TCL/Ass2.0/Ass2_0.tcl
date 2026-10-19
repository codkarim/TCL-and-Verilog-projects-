puts "****Assignment2.0****"
set cities [list cairo alexandria damietta dakahlia faiyum sohag aswan]

foreach loop $cities {
set uper [string toupper [string index $loop 0]]
set city_length [string length $loop]
set lower [string range $loop 1 $city_length]
set city_New [append uper $lower]
puts "the new format is : $city_New"
}
puts "karim abomera"

