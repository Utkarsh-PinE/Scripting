#!/usr/bin/perl

package cal;

BEGIN {
    print "Welcome to Cal.\n";
}
END{
    print "Bye.\n"
}
sub add
{
    return (shift)+(shift);
}

sub subtract
{
    return (shift)-(shift);
}
sub mul
{
    return (shift)*(shift);
}

sub div
{
    return (shift)/(shift);
}
1;