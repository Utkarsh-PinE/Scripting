#!/bin/bash
echo $PPID

#try to catch the signal when we press Ctrl+C from keyboard whils execution of scrupt

trap 'echo "You cannot run Ctrl+C in this script" ; echo $PPID' SIGINT
for i in {1..20}
do
	if [[ $i -ge 10 ]]
	then
		trap - SIGINT
	fi
	echo $i
	sleep 1
done
