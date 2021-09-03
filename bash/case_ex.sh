#!/bin/bash


#print the value of var2 if string in var starts with this and var2 = 4


var='This is my script'
var2=4
case $var in
	This*) echo "The string start with \"This\""
		case $var2 in
			4) echo "Condition is Satisfied, value of var2 is 4";;
			*) echo "The string start with \"This\ but var isn't 4"
		esac;;
	2) echo "value is two";;
	3) echo "value is two";;
	*) echo "None of the patterns match the value";;
esac
