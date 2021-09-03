#!/bin/bash

# Script to group and list the files on basis of their extension

echo "Enter path : "
read path
if ! ( test -d $path )
then
	echo "Path $path DOES NOT exists."
else
	for i in $(ls -p $path | egrep -v /$ | egrep -o '\..+' | sort | uniq)
	do
		echo -e "\nFiles with $i extension are :" 
		for j in $(ls $path)
		do
			if [[ $j =~ $i ]]
			then
				 echo "$j"	
			fi
		done
	done
fi
IFS=""
var=$(ls -p $path | egrep -v '/$|\.')
if [[ -n $var ]]
then
	echo -e "\nFiles without any extension are :"
	echo $var
fi
