function main_menu()
{
	echo -e "\t\t\t\t\t\t\tWelcome to password mananager\n"
	echo -e "\t\t\t\t\t\t\t1. Sign Up           :"
	echo -e "\t\t\t\t\t\t\t2. Log  in           :"
	echo -e "\t\t\t\t\t\t\t3. Forgot Password   :"
	echo -e "\t\t\t\t\t\t\t4. Exit              : "
	echo -en "\t\t\t\t\t\t\t   Enter your choice : "
}

function sign_up()
{
	clear
	echo  -en "\n\n\t\t\t\t\t\t\tEnter user name : \n\t\t\t\t\t\t\t"
	while [ 1 ]
	do
	read  var
	while [[ -z "$var" ]]
	do
		read var
	done
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
				encoded=$(./encrypt.o $pwd $pass1)
				echo -e "$1\n$encoded\nNULL\nNULL">$1.ppu									# If 'N' then entring NULL at place of Question and answer in file
			else
				echo -en "\n\t\t\t\t\t\t\tEnter the question :"
				read ques
				echo -en "\t\t\t\t\t\t\tEnter Answer :"
				read ans
				touch $1.ppu
				echo -e "$1\n$encoded\n$ques\n$ans">$1.ppu										# If 'Y' then storing it in the file
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
	read -p "$print" -s -n 1 pass
	if [[ $pass == $'\0' ]]																		
	then
		if [[ $pwd == "" ]]
		then
			continue
		else
			break
		fi
	elif [[  $pass == $'\177' ]]
	then
		if [[ ${#pwd} -ne 0 ]]
		then
			pwd=${pwd%?}
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
	echo -en "\n\t\t\t\t\t\t\tEnter user name : "
	read usrnm
	while [[ -z "$usrnm" ]]
	do
		read usrnm
	done
	if [[  $(ls | egrep "^$usrnm.ppu$") == "" ]]
	then
		echo -en "\t\t\t\t\t\t\tWrong Username.\n"
		echo -en "\t\t\t\t\t\t\tPress any key to exit. "
		read -n 1 check
		echo
	else
		question=$(cat $usrnm.ppu | head -3 | tail -1)
		if [[  $question == "NULL" ]]
		then
			echo -e "\n\t\t\t\t\t\t\tNo question is set for this account.";
			echo -en "\n\t\t\t\t\t\t\tPress any key to exit.";
			read -n 1 check
		else
			answer=$(cat $usrnm.ppu | head -4 | tail -1)
			echo -e "\n\t\t\t\t\t\t\tQuestion : $question"
			while [[ 1 ]]
			do
				echo -en "\n\t\t\t\t\t\t\tAnswer  : "
				read ans
				while [[ -z "$ans" ]]
				do
					read ans
				done
				if [[ $ans == $answer ]]
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
							sed '2s/.*/'$pass1'/1' $usrnm.ppu > temp
							cat temp > $usrnm.ppu
							rm temp 
							echo -en "\n\n\t\t\t\t\t\t\tPassword Changed.\n\t\t\t\t\t\t\tPress any key to exit."
							read -n 1 check
							break
						else
							echo -en "\n\n\t\t\t\t\t\t\tPassword not matched!\n"
						fi
					done
					break
				else
					echo -e "\n\t\t\t\t\t\t\tWrong Answer!"
				fi
			done
		fi
	fi
}
