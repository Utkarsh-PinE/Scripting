#!/usr/bin/bash
#for {set i 0} {[string index [lindex $argv 0] $i] != ""} {incr i} {
#}
#puts "Length of [lindex $argv 0] is $i"

#lmap l1 [split $argv "" ] { incr l }
#puts "Length of [lindex $argv 0] is $l"

puts "Length of [lindex $argv 0] : [expr [ string last [string index [lindex $argv 0] end] [lindex $argv 0] end] +1 ]"
