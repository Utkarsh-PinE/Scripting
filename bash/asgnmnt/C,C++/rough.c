#include <stdio.h>
#include <string.h>
#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
void str_cpy(char *str1,char *str2)
{
	int i=0;
	while(str1[i++]=str2[i]);
}
bool compare(const char* str1, const char *str2)
{
    for(int i=0;str1[i]!='\0'&&str2[i]!=0;i++)
    {
        if(str1[i]>str2[i])
        {
            return true;
        }
    }
    return false;
}
void sort(char *array[100],int row)
{
    for(int i=0;i<row-2;i++)
    {
        for(int j=0;j<row-2-i;j++)
        {
            if(compare(array[j],array[j+1]))
            {
                char *temp=array[j];
                array[j]=array[j+1];
                array[j+1]=temp;
            }
        }
    }
}

int main(int argc, char* argv[])
{
    char *array[100];
    char string[100];
    char ch;
    static int j=0;
    while((ch=getchar()) != EOF)
    {
    	if(ch=='\n'||ch==' ')
    	{
    		int l =strlen(string);
    		char *ptr=NULL;
    		ptr=malloc(l+1);
    		array[j]=ptr;
    		str_cpy(*(array+j),string);	
    		j++;
    		memset(string,0,(strlen(string)-1));
    	}
    	else
    	{
    		char *c=&ch;
    		strcat(string,c);
    	}
    }
    for(int i=0;i<8;i++)
        printf("%s\n",array[i]);
    
    sort(array,10);
    
    for(int i=0;i<8;i++)
        printf("%s\n",array[i]);
   // for(int i=0;i<;i++)
        //free(array[i]);
    return 0;
}
