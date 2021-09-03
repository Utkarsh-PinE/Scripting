BEGIN{
	max=1;
	ORS=""
}

{	
	for(i=1;i<=NF;i++)
	{
		arr[NR][i]=$i;
	}
	if(max<NF)
		max=NF;
}

END{

	for(i=max;i>=1;i--)
	{
		for(j=NR;j >=1;j--)
		{
			print arr[j][i]," "
			if(arr[j][i] == "")
				print " "		
		}
	print "\n"
	}
}

