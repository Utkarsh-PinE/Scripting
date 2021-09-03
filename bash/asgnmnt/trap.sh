#!/bin/bash

trap  echo"ctrl+z is encountered"  SIGTSTP SIGINT
for i in {1..20}
do
	echo $i
	sleep 1
done
