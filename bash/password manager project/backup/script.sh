#!/bin/bash
#This is the script of the password manager project.
source ~/pine/bash/password\ manager\ project/functions.sh
IFS=$'\n'
choice=0
: 'while getopts :id: options; do
	case $options in 
	id) echo "Entered $OPTARG";;
	?) echo "Going to project." sleep 1	;;
	esac
done'
clear
main_menu 
until [[ $choice -eq 4  ]]
do
	read  choice
	case $choice in
		1) sign_up ; clear ;  main_menu;;									
		2) log_in ; clear ; main_menu;;
		3) forgot_password; clear ; main_menu;;
		4) echo -e "\n\t\t\t\t\t\t\t   Exiting....";
		     break;;
		*) echo -e "\n\t\t\t\t\t\t\t   Invalid choice";
		    echo -en "\n\t\t\t\t\t\t\t   Please Wait : "
		    time=3;
		    while [[ $time -ne -1 ]]
		    do
		    	echo -n "$time"
		    	let time=time-1
		    	sleep 0.5
		    	printf "\b"
		    done
		    printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
		    echo -en " Enter your choice : ";;
		esac
done
