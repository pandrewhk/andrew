#!/usr/local/bin/perl

use HTML::FormatText::WithLinks;

my $f = HTML::FormatText::WithLinks->new(leftmargin => 0, rightmargin => 500000);

my $text = $f->parse_file(shift);

print $text;
