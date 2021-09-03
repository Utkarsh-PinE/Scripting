function main_menu()																		# Main UI at starting
{
	echo -e "\t\t\t\t\t\t\tWelcome to password mananager\n"
	echo -e "\t\t\t\t\t\t\t1. Sign Up           :"
	echo -e "\t\t\t\t\t\t\t2. Log  in           :"
	echo -e "\t\t\t\t\t\t\t3. Forgot Password   :"
	echo -e "\t\t\t\t\t\t\t4. Exit              : "
	echo -en "\t\t\t\t\t\t\t   Enter your choice : "
}

#*********************************************************Sign Up***********************************************************************
function sign_up()
{
	clear
	echo  -en "\n\n\t\t\t\t\t\t\tEnter user name (E to exit) : \n\t\t\t\t\t\t\t"
	while [ 1 ]
	do
		read  var
		while [[ -z "$var" ]]
		do
			read var
		done
		if [[  $var ==  "E" ]]
		then
			break
		fi
		temp='^'$var.ppu'$'
		if [[ $(ls -1 | egrep $temp | wc -l ) -eq 1 ]]													# Checking if user already exists or not.
		then 
			clear
			echo -e "\t\t\t\t\t\t\tUsername Exists."
			echo -en "\t\t\t\t\t\t\tPlease enter a new username :\n\t\t\t\t\t\t\t"
		else
			set_password $var;																		# If user doesn't exists, creating a password for user
			break;
		fi
	done
}

function set_password()																		#Function to set the password for a user-id.
{
	while [ 1 ]
	do
		echo  -en "\t\t\t\t\t\t\tEnter the password  : " 
		pass1=$( input_password )																# Returning the password enterd through input_password function
		echo -en "\n\t\t\t\t\t\t\tReconfirm password  : "
		pass2=$(input_password)
		if [[ $pass1 == $pass2 ]]																	# Validating the entered password
		then
			echo -en "\n\t\t\t\t\t\t\tDo you wish to have a security question (Y\N) "				# Inserting a security question (optional)
			read -n 1 sec
			usr=$1
			pwd=${usr:0:${#usr}/2}$pass1${usr:${#usr}/2}											#Adding half charcaters of username at start and end of passsword
			encoded=$(./encrypt.o $pwd $pass1)
			if [[ $sec != "Y" ]]
			then
				touch $1.ppu
				#encoded=$(./encrypt.o $pwd $pass1)
				echo -e "$1\n$pass1\nNULL\nNULL">$1.ppu									# If 'N' then entring NULL at place of Question and answer in file
			else
				echo -en "\n\t\t\t\t\t\t\tEnter the question :"
				read ques
				echo -en "\t\t\t\t\t\t\tEnter Answer :"
				read ans
				touch $1.ppu
				echo -e "$1\n$pass1\n$ques\n$ans">$1.ppu										# If 'Y' then storing it in the file
			fi
			echo -e "\n\t\t\t\t\t\t\tProfile Created."
			echo -en "\t\t\t\t\t\t\tPress any key to exit. "										# Expecting a key to be pressed to exit from the sign_up section.
			read -n 1 exit_stop
			break;
		else
			echo -e "\n\t\t\t\t\t\t\tPassword Doesn't Match."
		fi
	done
}

function input_password()
{
pwd=""
while [ 1 ]
do
	read -p "$print" -s -n 1 pass																	#taking character one by one
	if [[ $pass == $'\0' ]]																		
	then
		if [[ $pwd == "" ]]
		then
			continue
		else
			break
		fi
	elif [[  $pass == $'\177' ]]																	# For Backspace
	then
		if [[ ${#pwd} -ne 0 ]]																	#If password is null it should not delete the earlier characters
		then
			pwd=${pwd%?}																		#deleting last characters
			print=$'\b \b'
		else
			print=$'\0'
		fi
	else
		print="*"
		pwd=$pwd$pass
	fi
done
echo "$pwd"
}

#********************************************************Forgot Password***********************************************************
function forgot_password()
{
	clear
	IFS=$'\n'
	echo -en "\n\t\t\t\t\t\t\tEnter user name (E to exit) : "
	read usrnm
	while [[ -z "$usrnm" ]]																	#Reading till valid input is entered
	do
		read usrnm
	done
	if [[ $usrnm == "E" ]]																	#Exit case
	then
		return 0
	fi
	if [[  $(ls | egrep "^$usrnm.ppu$") == "" ]]												#If invalid username is entered
	then
		echo -en "\t\t\t\t\t\t\tWrong Username.\n"
		echo -en "\t\t\t\t\t\t\tPress any key to exit. "
		read -n 1 check
		echo
	else
		question=$(cat $usrnm.ppu | head -3 | tail -1)										#Extracting the question from the file
		if [[  $question == "NULL" ]]															#Checking if question present or not
		then
			echo -e "\n\t\t\t\t\t\t\tNo question is set for this account.";
			echo -en "\n\t\t\t\t\t\t\tPress any key to exit.";
			read -n 1 check
		else
			answer=$(cat $usrnm.ppu | head -4 | tail -1)										#Extracting the answer
			echo -e "\n\t\t\t\t\t\t\tQuestion : $question"
			while [[ 1 ]]
			do
				echo -en "\n\t\t\t\t\t\t\tAnswer  : "
				read ans
				while [[ -z "$ans" ]]															#Reading till valid answer is entered
				do
					read ans
				done
				if [[ $ans == $answer ]]														#If entered answer is correct, then ask for new password
				then
					while [[ 1 ]]
					do
						echo  -en "\n\t\t\t\t\t\t\tEnter the password  : " 
						pass1=$( input_password )
						echo -en "\n\t\t\t\t\t\t\tReconfirm password  : "
						pass2=$(input_password)
						if [[ $pass1 == $pass2 ]]
						then
							#pwd=${usrnm:0:${#usrnm}/2}$pass1${usr:${#usrnm}/2}
							#encoded=$(./encrypt.o $pwd $pass1)
							sed '2s/.*/'$pass1'/1' $usrnm.ppu > temp
							cat temp > $usrnm.ppu
							rm temp 
							echo -en "\n\n\t\t\t\t\t\t\tPassword Changed.\n\t\t\t\t\t\t\tPress any key to exit."
							read -n 1 check
							break
						else																
							echo -en "\n\n\t\t\t\t\t\t\tPassword not matched!\n"			#If re-enterrd password doesn't matches, prompt password not matched
						fi
					done
					break
				else
					echo -e "\n\t\t\t\t\t\t\tWrong Answer!"									#If answer is incorrect, then prompt answer not matched
				fi
			done
		fi
	fi
}

#********************************************************Log In*****************************************************
function log_in()
{
	clear
	echo -e "\n"
	while [[ 1 ]]
	do
		printf "%56s %-20s" " " "Enter Username (E to exit) : "
		read usr
		while [[ -z "$usr" ]]																	#Reading till valid choice is entered
		do
			read usr
		done
		if [[ $usr == "E" ]]
		then
			return 
		fi
		if [[  $(ls | egrep "^$usr.ppu$") == "" ]]												#If invalid username is entered
		then
			printf "%56s %-20s\n\n" " " "User Not Found"
		else
			while [[ 1 ]]
			do
				printf "\n%56s %-20s" " " "Enter Password (E to exit) : "
				inp_pass=$(input_password)
				if [[ $inp_pass == "E" ]]
				then
					return
				fi
				act_pass=$(head -n2 "$usr.ppu" | tail -n1)
				if [[ $inp_pass == $act_pass ]]
				then
					while [[ 1 ]]
					do
						clear
						echo -e "\n"
						printf "%56s%-20s%s\n" " " "1. Add an entry"        ":"
						printf "%56s%-20s%s\n" " " "2. Remove an entry" ":"
						printf "%56s%-20s%s\n" " " "3. Change an entry" ":"
						printf "%56s%-20s%s\n" " " "4. Backup entry"        ":"
						printf "%56s%-20s%s\n" " " "5. Delete Profile"       ":"
						printf "%56s%-20s%s\n" " " "6. Exit"                         ":"
						printf "%56s%-20s%s " " " "   Enter your choice"  ":"	
						read choice
						case $choice in
							1) Add_Entry $usr; clear ;;									
							2) Delete_Entry ; clear ;;
							3) Change_Entry; clear ;;
							4) Backup_Entry; clear ;;
							5) Delete_profile;clear;return;;
							6) return;;
						esac
					done
					break
				else
					echo
					printf "%57s%-20s\n" " " "Wrong Password"
				fi
			done
		fi
	done		
}


function Add_Entry()
{
	clear
	echo -e "\n"
	printf "%56s%20s" " " "Enter ID          (E to exit) : "
	read ID
	while [[ -z "$ID" ]]
	do
		read ID
	done
	if [[ $ID == "E" ]]
	then
		return
	fi
	while [[ 1 ]]
	do
		printf "%56s%20s" " " "Enter password    (E to exit) : "
		pass1=$(input_password)
		if [[ $pass1 == "E" ]]
		then
			return
		fi
		echo
		printf "%56s%20s" " " "Re-enter password (E to exit) : "
		pass2=$(input_password)
		if [[ $pass2 == "E" ]]
		then
			return
		fi
		echo
		if [[ $pass1 == $pass2 ]]
		then
			echo -en "\n\t\t\t\t\t\t\tDo you wish to have a note (Y/N): "
			read choice
			if [[ $choice == "Y" ]]
			then
				echo -en "\n\t\t\t\t\t\t\tEnter Note : "
				read note
				echo -e "$ID\n$pass1\n$note" >> "$1.ppu"
			else
				echo -e "$ID\n$pass1\nNULL" >> "$1.ppu"
			fi
			echo -en "\n\t\t\t\t\t\t\tEntry Added.\n\t\t\t\t\t\t\tPress any key to exit. "
			read exit_check
			break;
		else
			echo -e "\n\t\t\t\t\t\t\tPassword not matched"
		fi
	done	
}










