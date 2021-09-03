#include <stdio.h>
#include <string.h>
#include<stdlib.h>
const int MAXLINES = 100;
void str_cpy(char *str1,char *str2)
{
	int i=0;
	while(str1[i++]=str2[i]);
}

int less(const char *str1,const char *str2)
{
	for(int i=0;str1[i]!='\0' && str2[i]!='\0';i++)
		if(str1[i]>str2[i])
			return 1;
	return 0;
}

void bubbleSort(char *arr[MAXLINES],int n)
{
	for (int i = 0; i < n-1; i++)    
		for (int j = 0; j < n-i-1; j++)
			if(less(arr[j],arr[j+1]))
			{
				char *temp=arr[j];
				arr[j]=arr[j+1];
				arr[j+1]=temp;
			}
}

int main(int argc, char* argv[])
{
    	char **array;
    	array=(char**)malloc(MAXLINES*sizeof(char*));
    	char string[100];
    	int i=0;
    	while(!feof(stdin))
    	{
		scanf("%s\n",string);
       	char *ptr=malloc(strlen(string)+1);
       	array[i]=malloc(strlen(string)+1);
      		str_cpy(array[i],string);
      		i++;
    	}
	printf("Before Sorting : \n\n");
	for(int j=0;j<i;j++)
	        printf("%s\n",array[j]);
        
	bubbleSort(array,i);
    
	printf("\nAfter Sorting : \n\n");
	for(int j=0;j<i;j++)
		printf("%s\n",array[j]);
        
    
	for(int j=0;j<i;j++)
	    	free(array[j]);
    free(array);
    return 0;
}
