function call ()
{
	for(i=0;i<order;i++)
	{
		for(j=0;j<order;j++)
			printf("%c ",mat[i][j]);
		print
	}



}

BEGIN{
pass=ARGV[1];
key=ARGV[2];
order=int(sqrt(length(pass) + length(key))+2);
char mat[order][order];
for ( i=0;i<order;i++ )
{
	for(j=0;j<order;j++)
		mat[i][j]="a";
}
call();




















}
