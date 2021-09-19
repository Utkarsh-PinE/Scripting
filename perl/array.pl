#!/usr/bin/perl

# use warnings;
# use stricts;

=begin
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
my @num=(1..10);
my @alpha=(a..z);
my @Alpha=(A..Z);

print"@num\n@alpha\n@Alpha\n";
=cut


=begin
my %hash=('Utkarsh',1,'Verma',2);
$hash{123}="456";

printf("$hash{123}\n");
=cut


=begin
# Array Functions

push @num,11;
push @alpha,'A';
push @Alpha,'z';
print"\n\n@num\n@alpha\n@Alpha\n";
=cut

=begin
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
Merging arrays
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
#For loops
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
#hashes
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
Assignment :
print output  like this :
Value of hash<key> = <value>

Answer :

my %hash = ('A',1,'B',2,'C',3);
for(keys %hash)
{
	print "Value of hash {$_} = <$hash{$_}>\n";
}
=cut

=begin
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