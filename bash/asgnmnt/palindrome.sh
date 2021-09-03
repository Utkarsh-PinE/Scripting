#!/bin/bash

#Script to check if the input string is palindrome or not.

echo "Enter the string : "
read str
len=${#str}

#********************Method 1********************
for ((i=0;i<len;i++))
{
	rev=$rev${str:$len-i-1:1}
}

if [[ $str == "$rev" ]]
then
	echo "$str is palindrome."
else
	echo "$str is not palindrome."
fi

#********************Method 2*******************
: '
if (( $len%2 == 1 ))
then
	#rev=${rev:0:$len/2*3}"."${rev:$len/2*3}
	rev="."
fi

for (( i=0;i<len/2;i++))
{
	let temp=$len/2-$i
	rev="(.)"$rev"\\"$temp
}

if [[ $str =~ $rev ]]
then
	echo "$str is palindrome."
else
	echo "$str is not palindrome."
fi'


















#********************Method 3********************
: '
for ((i=0;i<len/2;i++))
do
	rev=$rev"(.)"
done

if (( $len%2 != 0 ))
then
	rev=$rev"."
fi

for (( i=0;i<len/2;i++ ))
{
	let j=($len)/2-$i;
	rev=$rev"\\$j"
}

echo "Rev is $rev"
if [[ $str =~ $rev ]]
then
	echo "$str is palindrome."
else
	echo "$str is not palindrome."
fi'

#********************Method 4********************
: '
for (( i=0;i<len/2;i++))
{
	let temp=len/2-$i
	let first=($i+1)*3+$i*2;
	rev="(.)"$rev
	rev=$rev"\\$temp"
	tmp=${rev:0:$first}
}
if (( $len%2 == 1 ))
then
	rev=${rev:0:$len/2*3}"."${rev:$len/2*3}
fi

if [[ $str =~ $rev ]]
then
	echo "$str is palindrome."
else
	echo "$str is not palindrome."
fi'
