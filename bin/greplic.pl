#!/usr/local/bin/perl -w

use strict;

my %licregex=(
	'Apache License\s*\n\s*Version 2.0, January 2004' => "Apache 2.0",
	'GNU GENERAL PUBLIC LICENSE\s*\n\s*Version 2, June 1991' => "GPL 2",
	'GNU GENERAL PUBLIC LICENSE\s*\n\s*Version 3, 29 June 2007' => "GPL 3",
	'GNU LESSER GENERAL PUBLIC LICENSE\s*\n\s*Version 2.1, February 1999' => "LGPL 2.1",
	'GNU Free Documentation License\s*\n\s*Version 1.1, March 2000' => "GFDL 1.1",

);

while(my $tarfile=shift){
	open(TAR,"tar xOf $tarfile '*[Cc][Oo][Pp][Yy][Ii][Nn][Gg]*' '*[Ll][Ii][Cc][Ee][Nn][SsCc][Ee]*' 2>&- |");
#print "Opened tar";
	local $/;
	my $tar=<TAR>;
#print "Slurped tar";

	my @lics;
	for(keys %licregex){
		if($tar=~/$_/m){
			push @lics, $licregex{$_};
		}
	}
	print "$tarfile: ".join(", ", @lics)."\n";
}
