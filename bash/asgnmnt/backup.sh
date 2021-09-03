#!/bin/bash

# Script to group and list the files on basis of their extension

echo "Enter path : "
read path
if !( test -d $path )
then
	echo "Path $path DOES NOT exists."
else
	let flag=0
	for i in $(ls -p $path | egrep -v '/$' | egrep -o '\..+' | sort | uniq)
	do
		echo -e "\nFiles with \033[1;36m$i\033[0m extension are :" 
		for j in $(ls $path)
		do
			if [[ $j =~ $i ]]
			then
				 echo "$j"	
			fi
		done
	done
	for i in $(ls -p $path | egrep -v '/$' | egrep -v '\.')
	do
		if (( $flag == 0 ))
		then
#			printf "\n*************************************************\n"
			echo -e "\nFiles without any extension are :"
			flag=1
		fi
		#if [[ $i = "[^/]" ]]
		#then
			echo "$i"
		#fi
	done
	#printf "*************************************************\n"
fi
