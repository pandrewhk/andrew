#!/usr/local/bin/perl -wTC
#

use Encode;
use Lingua::JA::Kana;

my $arg = shift;
$ENV{PATH} = '';
delete @ENV{'IFS', 'CDPATH', 'ENV', 'BASH_ENV', 'PATH'};

if( defined $arg ) {
	my $hiragana = romaji2hiragana($arg) if $arg =~ /[a-zA-Z]+/;
	$hiragana =~ /(\w+)/;
	$hiragana = $1;
	print "=== $hiragana ===\n";
	system("/usr/bin/grep $hiragana /usr/local/share/dict/edict-utf-8/edict|/usr/bin/less");
};
