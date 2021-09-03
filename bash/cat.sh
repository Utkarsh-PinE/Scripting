#!/bin/bash

for i in $(ls)
do
	echo "***********File : $i*********"
	cat $i
	echo
done
