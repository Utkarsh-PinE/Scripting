BEGIN{
ORS = "\n"
}

{
	for(i=1;i<=NF;i++)
		printf("%-10s",$i);
	printf("%s",ORS);
}


END{
	print "END"
}
