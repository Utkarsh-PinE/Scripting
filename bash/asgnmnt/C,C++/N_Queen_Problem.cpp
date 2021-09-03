#include<iostream>
#include<cstdlib>
using namespace std;

void display(int **arr,int N)
{
    for(int i=0;i<N;i++)
    {
        for(int j=0;j<N;j++)
            cout << arr[i][j] << " ";
        cout << endl;
    }
}

bool can_be_placed(int **arr,N,int i,int j)
{
    for(int k=0;k<j;k++)
    {
        if(arr[i][j]==1)
            return false;
    }

    int temp_i=i,temp_j=j,t_i=i,t_j=j;
    while(temp_i>-1 || temp_j>-1 || t_i == N || t_j == N)
    {
        temp_i--;
        temp_j--;
        t_j++;
        t_i++;
        if(arr[temp_i][temp_j]==1)
            return false;
        if(arr[t_i][t_j]==1)
            return false;
    }
    return true;
}

bool check(int **arr,int N,int rank=0)
{
    int i,j;
    for(i=0;i<N;i++)
    {
        arr[0][i]=1;
        for(j=0;j<N;j++)
        {
            if(j!=i)
            {

            }
        }
    }
    //display(arr,N);
}


int main()
{
    int N=4;
    int **arr=new int*[N];
    for(int i=0;i<N;i++)
    {
        arr[i]= new int[N];
        for(int j=0;j<N;j++)
            arr[i][j]=0;
    }
    cout << "Original : " << endl;
    display(arr,4);

    check(arr,N);

    for(int i=0;i<N;i++)
    {
        delete[] arr[i];
        arr[i]=NULL;
    }
    delete[] arr;
}



