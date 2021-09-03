#!/bin/bash

declare -r var="MNamaNM"
declare -r check=$(echo $var | egrep '(.)(.)(.).\3\2\1')

echo $check
if [[ $check =~ $var ]]
	then 
		echo "Palindrome"
else
		echo "Not Palindrome"
fi
