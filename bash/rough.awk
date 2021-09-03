BEGIN{
}
/^[^#]/{
	check=0;
	for(i=1;i<=NF;i++)
	{
		if($i == "#")
		{
		check=1;
		field=i;
		break;
		}
	}
	if(check == 0 )
		print $0
	else
	{
		for(i = field+1;i<=NF;i++)
			printf length($i) " "
		printf " - "
		for(i=1;i<field;i++)
			printf length($i) " "
		print ""
	}
	check=0
}
