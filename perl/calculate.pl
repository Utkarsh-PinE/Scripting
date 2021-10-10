#!/usr/bin/perl
use lib "$ENV{'HOME'}/Scripting/perl/packages";
use cal;
my $a=5;
my $b=10;
my $r1=cal::add($a,$b);
my $r2=cal::subtract($a,$b);
my $r3=cal::mul($a,$b);
my $r4=cal::div($a,$b);

print "$r1\n$r2\n$r3\n$r4";