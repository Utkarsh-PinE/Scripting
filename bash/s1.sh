#!/bin/bash

str="PinE9 Scripting"
echo -e "Length : "${#str}	#length by {#str}
#var ={#str}
echo ${str:2:4}		# 
echo ${str/ine/INe}		#string/<glob pattern>/replacement

str="bash.string.txt"
echo ${str#*.}    			#string <opearator>pattern
echo ${str%%.*}			#   ## -> look from left, %% -> look from right    (# nongreedy approach, ## greedy approach)
