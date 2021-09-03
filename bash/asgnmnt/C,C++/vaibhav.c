#include<stdio.h>
#include<stdlib.h>
int len(const char* str)
{
	int l;
	for(l=0;str[l]!='\0';l++);
	return l;
}
char* hextobin(char* str)
{
	if(str==NULL)
		return NULL;
	int l=len(str);
	char *res=malloc(sizeof(char)*l*4+1);
	res[l*4]='\0';
	for(int i=0;i<l;i++)
	{
		int num;
		if(str[i]>='0' && str[i]<='9')
			num=str[i]-'0';
		else if (str[i]>='A' && str[i]<='F')
			num=str[i]-('A' - 10);
		else if(str[i]>='a' && str[i]<='f')
			num=str[i]-('a' - 10);
		else
		{
			free(res);
			return NULL;
		}
		int loop=4;
		while(loop>0)																		//
		{
			res[i*4+loop-- -1]=(char)(num%2+'0');
			num/=2;
		}
	}
	return res;
}

int main()
{
	char str[100];
	printf("Enter the string : ");
	scanf("%s",str);
	char* res=hextobin(str);
	printf("str : %s\n",res);
	free(res);
}
