#!/bin/bash
count=0;
i=0
lines=$(wc -l file | cut -d " " -f 1)
for i in $(cat "file")
do
	let count=$count+1
	if [[ $count -eq $lines ]]
	then
		echo "Do some operation"
	fi
done
