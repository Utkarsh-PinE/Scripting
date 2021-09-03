#!bin/bash
awk -v var="final test" '
			BEGIN{
			IFS=$'\n'
				arr[0]="Note"
				arr[1]="Website"
				arr[2]="User ID" 
				arr[3]="Password"
				i=1
			}
			{
				if (NR >4 )
				{
					if (NR%4 == 3)
					{
						cmd = "bash decryption.sh " "\"" $0 "\" " "\"" substr(FILENAME,1,length(FILENAME)-4) "\""
						cmd | getline result
						printf "\n\t\t\t\t\t\t\t%d) %-10s: %s\n",i++,arr[NR%4],result
					}
					else
						printf "\n\t\t\t\t\t\t\t%d) %-10s: %s\n",i++,arr[NR%4],$0
				}
			}' "$1.ppu"
