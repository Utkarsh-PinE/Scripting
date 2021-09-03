BEGIN{
	ORS=""
}
{
	for(i=1;i<=NF;i++)
	arr[NR][i]=$i;
}
END{
for(i=NR;i>=1;i--)
{
	for(j=NR;j>=1;j--)
		print arr[j][i] " "
	print "\n"
}
}
