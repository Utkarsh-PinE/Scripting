#!/bin/bash

i=10
until [[ $i -lt 5 ]]
do
	echo $((i--))
done
