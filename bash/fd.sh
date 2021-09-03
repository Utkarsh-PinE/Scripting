#!/bin/bash

exec 3<> file

i=0
echo -n "New" >&3
: 'while read -u 3
do
	echo "initial : $i"
	if [[ $i -eq 0 ]]
	then
		echo "New content" >&3
	fi
	let i=$i+1
done '

exec 3>&-
