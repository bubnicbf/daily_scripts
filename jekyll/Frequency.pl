#!/usr/bin/perl

my %counts = () ;
 
while (my $cmd = <STDIN>) {
    chomp $cmd ;
    if (!$counts{$cmd}) {
        $counts{$cmd} = 1 ;
    } else {
        $counts{$cmd}++ ;
    }
}
 
foreach $k (keys %counts) {
    my $count = $counts{$k} ;
    print "$count $k\n" ;
}