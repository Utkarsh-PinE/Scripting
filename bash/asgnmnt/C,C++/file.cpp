//#include<iostream>
//using namespace std;
//struct bits{
//	int x:32;
//	int y:32;
//	int p:32;
//	int n:32;
//}st1;
//
//int set_bits(int x,int p,int n,int y)
//{
//	y=~(~0<<n) & y;
//	y<<=(p-n+1);
//	x=x& ~((~(~0 << n)) << (p-n+1));
//	return x | y;
//}
//
//int main()
//{
//	st1.x=0xAA;
//	st1.y=0x7;
//	st1.n=0x3;
//	st1.p=0x5;
//	int ans=set_bits(st1.x,st1.p,st1.n,st1.y);
//	cout << ans;
//	return 0;
//}
