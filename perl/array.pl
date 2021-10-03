#!/usr/bin/perl

# use warnings;
# use stricts;

=begin
# Introduction
my @array1=(1,2,3,4,5,6,7,8);
my @array2=qw(PinE	batch		 Perl);

print "$array1[10]\n"
my @copy=@array1;
my $size=@array1;				#print scalar @array1 || print @array1 .
print "$copy[2]\n$size";

my $len=$#array1;
print"$len\n";
print "$array2[0]\t$array2[2]\n";
print "$array1[3]\t$array1[-5]\n"
=cut

=begin
# Arrays
my @num=(1..10);
my @alpha=(a..z);
my @Alpha=(A..Z);

print"@num\n@alpha\n@Alpha\n";
=cut

=begin
# Array Functions
push @num,11;
push @alpha,'A';
push @Alpha,'z';
print"\n\n@num\n@alpha\n@Alpha\n";
=cut

=begin
# Push pop in array
# pop @num;
# pop @alpha;
# pop @Alpha;
# print"Length before :  $#num\n";
# my $variable = shift @num;
# print "$variable\n";
# print"Length after :  $#num\n";
# print"Before @num\n";
# unshift @num,12;
# print "After @num\n";
=cut

=begin
# my $string=join(';',@num);
# print "$string\n";

# my @new_num=split('',$string);
# print "$#new_num\n@new_num\n";
=cut


=begin
# Sort Function
my @num2=(1,2,3,4,13);
@num3 = sort {(-1,1)[$a<$b]} @num2;
print "@num3";
=cut

=begin
# To change the index of array (previous versions)
my @temp = (12,3,4,5);
print "Before : $temp[1]\n";
$[ = 1;
print "After $temp[1]\n";
=cut

=begin
# Merging arrays
my @odd=(1,3,5);
my @even = (2,4,6);
my @final=(@odd,@even);
print "@final"
=cut


=begin
# Selection from array
$var1 = (1,2,3,4,5)[2];
@temp = (1,2,3);
$var2 = $temp[2];
print "$var1\n$var2\n";

my $string2 = "This is PinE Perl Batch -2 Class 3rd";
$var3 =(split ' ',$string2)[3];
@arr2 = (split ' ',$string2)[0..3];
print "$var3\n@arr2\n";
=end


=begin
# For loops
my @num = (1..20);
#for (initialization;condition;updation)
for (my $i=0;$i<20;$i++)
{
	print "Value = $num[$i]\n";
}

my @alpha = (a..j);
for(@alpha)
{
	print "$_ ";				#denotes the iterable value
}
print "\n";
foreach my $j (@alpha)
{
	print"$j ";
}
print "\n";
=cut


=begin
# hashes
my %hash = ('A',1,'B',2,'C',3);
my @values = values (%hash);
my @keys = keys (%hash);

print %hash;

foreach  $key (keys (%hash))
{
	print "$key ";
}
print "\n";

foreach  $val (values (%hash))
{
	print "$val ";
}
print "\n";
=cut

=begin
# looping in hash
my @arr=(a..e);
my @add=\@arr;
%hash = ('A',[(1,2,3,4)],'B',@add,'C',3);
for(keys %hash)
{
	print "Value of hash {$_} = ";
	if(ref($hash{$_}) eq "")
	{
		print "$hash{$_}\n";
	}
	elsif(ref($hash{$_}) eq "ARRAY")
	{
		print "@{$hash{$_}}\n";
	}
	else
	{
		print %{$hash{$_}};
		print "\n";
	}
}
print %hash{'A'}->[3];
=cut

=begin
# Cheking existence
my %hash = ('A',1,'B',2,'C',3);
my @num = (1..9);
if(exists($hash{'A'}))
{
	print "hash{'A'} Exists\n";
}
else
{
	print "hash{'A'} Not exists\n";
}
if(exists($num[8]))
{
	print " num[15 ]Exists\n";
}
else
{
	print "num[15] Not exists\n";
}
=cut

=begin
# Adding and deleting
my %hash = ('A',1,'B',2,'C',3);
$hash{'D'}=4;
print "$hash{D}\n";
delete $hash{'D'};
print "$hash{D}\n";
@v=(1..9);
print $#(keys %hash);
=cut

=begin
# until loop
my $a=4;
until($a>10)
{
	print "$a\n";
	$a++;
}
=cut

=begin
# while loop
my $a=3;
while($a<7)
{
	print "$a\n";
	$a++;
}
=cut

=begin
# dowhile loop
my $c=1;
do
{
	print "$c\n";
	$c++;
}while($c<6);
=cut

=begin
# control statements in loop
# my @num=(1..20);
# for(my $i=0;$i<20;$i++)
# {
# 	if($i == 4)
# 	{
# 		last;								# last is break , next is continue
# 	}
# 	else
# 	{
# 		print "$num[$i]\n";
# 	}
# }
=cut

=begin
# nested loop
for(my $i=0;$i<7;$i++)
{
	for(my $j=0;$j<5;$j++)
	{
		if($i==5)
		{
			last;
		}
		else
		{
			print "$i $j\n";
		}
	}
}
=cut

=begin
# goto
my $p = 10;

go : do
{
	if($p == 15)
	{
		$p++;
		goto go;
	}
	print "Value = $p\n";
	$p++;
}while($p < 20);
=cut


=begin
# if else if in loop
for(my $a =1;$a<10;$a++)
{
	if($a == 4)
	{
		print "Hello";
	}
	elsif($a == 6)
	{
		print "Hi\n";
	}
	else
	{
		print "Bye\n";
	}
}
=cut

=begin
# ternary operator
my $num1 = 30;
my $str = ($num1 >25) ? "Pass" : "Fail";
print "$str\n";
=cut


=begin
# unless in loop
for(my $a =1;$a<21;$a++)
{
unless($a == 20)
	{
		print "a is not equal to 20\n";
	}
	elsif($a == 20)
	{
		print "a is 20\n";
	}
	else
	{
		print "I am not sure what is a\n";
	}
}
=cut



=begin
# switch statement
use Switch;							#sudo apt-get install libswitch-perl
my $var=int(10);

switch(int($var))
{
	case '10' {print "$var is string\n";}
	case int(10)  {print "$var is number\n;"}
	else     {print "Couldn't identify\n"}
}
=cut


=begin
# operators
< lt
>gt
== eq
<= le
>= ge
cmp (-1,0,1)

a = "ABCgj" b ="GMIJ"
$b cmp a -1 0 1

bitwise and = &
bitwise or = |
bitwise xor = ^
one compliment = ~
left shift = <<
right shift = >>


homework:-
my $a = 12
my $b = 13
$c = $a & $b;
$d = $a << 1   $b >> 2
print "$c\n";
=cut

=begin
# Regex
my $str="Hello I   am from Pine";
$str=~m/I\s+am/;
print "Matched : $&\n";
print "Before  : $`\n";
print "After   : $'\n";

# #Remembrance
$str=~m/I(\s+am)\s+(f.+)\s+/;
print "First Remembrance : $1\n";
print "Second Remembrance : $2\n";


#Substitution
$str=~s/aM/AM/i;                #i for case-insensitive
print "$str";



($strcopy=$str)=~s/am/AM/i;
print "$str,$strcopy\n";


#Translation
$str =~ tr/o/./c;
print $str;
=cut

=begin
# Subroutine and Local/State Variables
sub print_o
{
    print "Hello Utkarsh\n";
}
print_o();
&print_o();

sub average
{
    $sum=0,$n=@_;
    foreach (@_)
    {
        $sum+=$_;
    }
    $avg=$sum/$n;
    print "Average : $avg\n";
}
average(1,2,3);

# Local Variable
$string = "global";
sub print_f
{
    print "Before $string\n";
    local $string = "local";
    print "After $string\n";
}
print_f($string);
print "$string\n";


#State Variable
#Write use feature 'state'
use feature state;
sub count
{
    state $count = 0;               #same as static variable in c
    print "$count\n";
    $count++;
}
count();
count();
count();
=cut