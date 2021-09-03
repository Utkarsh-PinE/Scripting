#include<iostream>
#include<stack>
using namespace std;
bool check(int,int);
class Stack
{
	char *data;
	int top,size;
public:
	Stack(int size=0) :top{-1},size{size}
	{
		if(size==0)
		{
			data=nullptr;
			return;
		}
		data=new char[size];
		for(int i=0;i<size;i++)
			data[i]='0';
	}
	void push(char item)
	{
		if(isfull())
		{
			cout << "Stack full.\n";
			return;
		}
		data[++top]=item;
	}

	void pop()
	{
		if(empty())
		{
			cout << "Stack empty.\n";
			return;
		}
		top--;
		//cout << "Popped : " << data[top--] << endl;
	}

	char view() const {return (top==-1) ? '0':data[top];}

	bool empty() const
	{
		return top==-1;
	}

	bool isfull() const
	{
		return top==size-1;
	}

	~Stack()
	{
		delete []data;
	}
};

/*bool check_paranthesis(const string& str)
{
	stack<char> st;
	for(int i=0;i<str.size();i++)
	{
		if(str[i]=='(' || str[i]=='{' || str[i]=='[')
			st.push(str[i]);
		else if(st.empty())
			return false;
		else if(str[i]==')' && st.top()=='(')
				st.pop();
		else if(str[i]=='}' && st.top()=='{')
				st.pop();
		else if(str[i]==']' && st.top()=='[')
				st.pop();
	}
	return st.empty();
}*/

string str;
stack<char> st;

bool check(int check=1,int pos=0)
{
	if(check==0)
		return false;
	if(str[pos]=='(' || str[pos]=='{' || str[pos]=='[')
	{
			st.push(str[pos]);
			return check(1,pos+1);
	}
	else
	{
		if(str[pos]==')')
		{
			if(st.empty())
			{
				check=0;
				return false;
			}
			st.pop();
			return check(1,pos+1);
		}
	}
	return false;
}

int main()
{
	//string str;
	cout << "Enter String : ";
	cin >> str;
	//stack<char> st;
	if(check(1,0))
		cout << "Valid\n";
	else
		cout << "Invalid\n";
}

