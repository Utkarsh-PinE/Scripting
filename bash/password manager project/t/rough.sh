#!bin/bash
#echo ${#usr}
#echo ${usr:0:${#usr}/2}
#echo ${usr:${#usr}/2}

#str=$(echo "library(rfgdgf) {" | egrep -o 'library\((.*)\)')
#echo ${str,#*)}

var=$(ls *.sh)

for i in $var
do
	cp $i /home/utkarsh/pine/bash/password\ manager\ project/t/
done
