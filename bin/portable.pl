#!/usr/bin/env perl

use Getopt::Long;

my $indexfile='/usr/ports/INDEX-8';
my $maintainer='infofarmer@FreeBSD.org';

GetOptions('index' => \$indexfile, 'maintainer' => \$maintainer);

# distribution-name|port-path|installation-prefix|comment| \
#  description-file|maintainer|categories|extract-depends| \
#  patch-depends|fetch-depends|build-depends|run-depends|www site

open INDEX,'<',$indexfile;
print '<html><body><table>';
while(<INDEX>){
#	my ($name,$path,$pref,$com,$descr,$maint,$cat,$edep,$pdep,$fdep,
	my ($name,$path,$pref,$com,$descr,$maint,$cat,$bdep,$rdep,$www)=
		split /\|/;
#	my ($mss)=split /\s+/,`cd $path;make master-sites-all`;
	if($maint==$maintainer){
		my $mss=`cd $path;make master-sites-all`;
		my ($mss1)=split /\s+/,$mss;
		$mss1=~m#^([a-z]+://[^/]+/)#;
		my $mss1base=$1;
		my $distver=`cd $path;make -V DISTVERSION`;
		#my $portname=`cd $path;make -V PORTNAME`;
		chomp ($mss,$distver,$portname);
		print "<tr><td>$name</td><td>$distver</td>";
		print "<td><a href=\"$mss1\">$mss1base</a><td>";
		print "<td><a href=\"$www\">www</a></td></tr>\n";
	}
}
print '</table></body></html>';
