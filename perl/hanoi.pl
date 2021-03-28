#!/usr/bin/perl

use strict;
use warnings;
use utf8;

sub hanoi {
    if($_[0] == 1) {
        print $_[1], "-->", $_[3], " ";
        return 0;
    }
    hanoi($_[0] - 1, $_[1], $_[3], $_[2]);
    print $_[1], "-->", $_[3], " ";
    hanoi($_[0] - 1, $_[2], $_[1], $_[3]);
}

my $n = <STDIN>;
hanoi($n, 'A', 'B', 'C');
print "\nPress Enter to continue...\n";
<STDIN>;
