#!/usr/bin/perl

# use warnings;
# use stricts;

# my @array1=(1,2,3,4,5,6,7,8);
# my @array2=qw(PinE	batch		 Perl);

# print "$array1[10]\n"
# my @copy=@array1;
# my $size=@array1;
# print "$copy[2]\n$size";

# my $len=$#array1;
# print"$len\n";
# print "$array2[0]\t$array2[2]\n";
# print "$array1[3]\t$array1[-5]\n"



my @num=(1..10);
my @alpha=(a..z);
my @Alpha=(A..Z);

# print"@num\n@alpha\n@Alpha\n";


#Array Functions

# push @num,11;
# push @alpha,'A';
# push @Alpha,'z';


# print"\n\n@num\n@alpha\n@Alpha\n";


# pop @num;
# pop @alpha;
# pop @Alpha;

# print"Length before :  $#num\n";
my $variable = shift @num;
print "$variable\n";
# print"Length after :  $#num\n";
# print"Before @num\n";
# unshift @num,12;
# print "After @num\n";


my $string=join(';',@num);
print "$string\n";

my @new_num=split('',$string);
print "$#new_num\n@new_num\n";