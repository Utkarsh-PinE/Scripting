#!/usr/bin/tclsh
set str [lindex $argv 0]
puts "$str is [expr [string equal $str [string reverse $str]] ? \"{Palindrome}\" : \"Not palindrome\"  ]"
