#!/bin/bash

IFS=' '
for i in $(cat file)
do
	echo "i is $i"
done
