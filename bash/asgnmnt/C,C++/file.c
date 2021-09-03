#include <stdio.h>
	#include <string.h>
#include<stdio.h>
#include<stdlib.h>
void str_cpy(char *str1,char *str2)
{
	int i=0;
	while(str2[i]!='\0')
	{
	printf("%c\n",str2[i]);
	str1[i]=str2[i];
	i++;
	}
	str1[i]='\0';
	
}
int main(int argc, char* argv[])
{
    char **array;
    char string[100];
    for(int i=0;i<9;i++)
    {
        scanf("%s",string);
        //array[i]=(char*)malloc(strlen(string)+1);
        printf("%s %d\n",string,(int)(strlen(string)));
        //str_cpy(*(array+i),string);
	//array[i]=string;
	//printf("String is %s and %s\n",array[i],string);
	
    }
    /*for(int i=0;i<9;i++)
    {
        printf("%s and %c\n",array[i],*array[i]);
    }  */ 
    return 0;
}
