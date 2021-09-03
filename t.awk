BEGIN{

str="RVERT"
l=length(str)
for(i=0;i<length(str);i++)
	arr[i]=substr(str,l-i,1)
print arr[0]
}

