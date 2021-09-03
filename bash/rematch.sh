#!/bin/bash

x="This is PinE9 Scripting"
if [[ $x =~ ([a-zA-Z ]+)PinE(.*) ]]
then
	echo "Regex matches $x"
	echo $BASH_REMATCH
	echo ${BASH_REMATCH[1]}
	echo ${BASH_REMATCH[2]}
fi
echo "*************"
for i in ${BASH_REMATCH[@]}
do
	echo $i
done
