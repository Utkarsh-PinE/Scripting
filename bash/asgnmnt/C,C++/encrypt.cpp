#include<iostream>
#include<string>
#include<cmath>
#include<vector>
using namespace std;

void swap(char &c1,char &c2)
{
	char temp=c1;
	c1=c2;
	c2=temp;
}
void display(int N,const vector <vector<char>> &mat)
{
	for(int i=0;i<N;i++)
	{
		for(int j=0;j<N;j++)
			cout << mat[i][j] << " ";
		cout << endl;
	}
}

void set(int N,vector <vector<char>> &mat)
{
	int num=0;
	for(int i=0;i<N;i++)
	{
		for(int j=0;j<N;j++)
			mat[i][j]=(rand()%26)+'a';
	}
}

void place(int N,vector <vector<char>> &mat,const string &pass,const string& key)
{
	char dir='L';
	int left=0,up=0,down=N-1,right=N-1;
	int count=0;
	string temp=pass+key;
	int toreplace=temp.size()-1;
	while(toreplace>=0)
	{
		if(dir=='L')
		{
			for(int i=left;i<=right;i++)
				if(toreplace!=-1)
					mat[up][i]=temp[toreplace--];
			up++;
			dir='D';
		}
		else if(dir=='D')
		{
			for(int i=up;i<=down;i++)
				if(toreplace!=-1)
					mat[i][right]=temp[toreplace--];
				right--;
			dir='R';
		}
		else if(dir=='R')
		{
			for(int i=right;i>=left;i--)
				if(toreplace!=-1)
					mat[down][i]=temp[toreplace--];
			down--;
			dir='U';
		}
		else if(dir=='U')
		{
			for(int i=down;i>=up;i--)
				if(toreplace!=-1)
					mat[i][left]=temp[toreplace--];
			left++;
			dir='L';
		}
	}
}


void shuffle(int N, vector <vector<char>> &mat)
{
	for(int i=0;i<N/2;i++)
		for(int j=0;j<N;j+=2)
			swap(mat[i][j],mat[N-i-1][j]);
	for(int i=1;i<N;i+=2)
		for(int j=0;j<N/2;j++)
			swap(mat[i][j],mat[i][N-j-1]);
}

void transpose(int N,vector <vector<char>> &mat)
{
	for(int i=0;i<N;i++)
	{
		for(int j=i+1;j<N;j++)
		{
			char temp=mat[i][j];
			mat[i][j]=mat[j][i];
			mat[j][i]=temp;
		}
	}
}

string encrypt(const string& pass,const string &masterkey="")
{
	int l=pass.size()+masterkey.size();
	int N=(int)sqrt(l)+2;
	vector <vector<char>> mat(N,vector<char>(N));
	string enc="";
	set(N,mat);
	if(masterkey!="")
		place(N,mat,pass,masterkey);
	shuffle(N,mat);
	transpose(N,mat);
	for(int i=0;i<N;i++)
		for(int j=0;j<N;j++)
			enc=enc+mat[i][j];
	return enc;
}

int main (int argc, char const* argv[])
{
	string enc;
	if(argc == 3)
		enc=encrypt(argv[1],argv[2]);
	else if(argc == 2)
		enc=encrypt(argv[1]);
	else
	{
		string pass,key;
		cout << "Enter Password : " << endl;
		getline(cin,pass);
		cout << "Enter key : " << endl;
		getline(cin,key);
		enc=encrypt(pass,key);
	}
	cout << enc << endl;
	return 0;
}

