#!/usr/bin/tclsh
#set ip 192.30.40.1
#set ip1 [split $ip "."]
#set index1 [lindex $ip1 1]
#set index2 [lindex $ip1 2]
#lset ip1 1 $index2
#lset ip1 2 $index1
#set ip1 [join $ip1 "."]
#puts $ip1

set ip2 [split [lindex $argv 0] "."]
puts "Swapped ip : [lindex $ip2 0].[lindex $ip2 2].[lindex $ip2 1].[lindex $ip2 3]"
