BEGIN{
	i=0
	while(getline arr1[i++] <"file1")
	{
	}
	i=0;
	while(getline c <"file2")
	{
		if(i>=1)
		{
		arr2[i-1]=($2+$1)/2
		}
	}
	for(i=0;i<length(arr1);i++)
	{
		print arr1[i],arr2[i]
	}
	i=0;
}

#{
#	if(NR>1)
#	{
#		arr2[i]=($1+$2)/2
#		i++
#	}
#}
#END{
#	print "Name : Total %"
#}
