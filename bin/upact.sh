#!/bin/sh

cpanlistfile="/home/sat/tmp/list"
pcvs="env CVS_RSH=ssh cvs -d sat@pcvs.freebsd.org:/home/pcvs"

for i in "$@"; do
	o=${i#/usr/ports/}
	o=${o%/}
	n=${o#*/}
	p="/usr/ports/$o"
	mkdir -p ~/bsdevel/upact/
	if [ -z "${n##p5-*}" ]; then
		portver=`cat $p/Makefile|grep -m1 PORTVERSION|awk '{print $2}'`
		maint=`cat $p/Makefile|grep -m1 MAINTAINER`
		maint=${maint##*=	}
		distver=`cat $p/Makefile|grep -m1 DISTVERSION|awk '{print $2}'`
		portrev=`cat $p/Makefile|grep -m1 PORTREVISION|awk '{print $2}'`
		distinfo=`cat $p/distinfo*|grep -m1 SIZE`
		distinfo=${distinfo#*(}
		distinfo=${distinfo%)*}
		distfile=$distinfo
		distinfo=`echo $distinfo|sed -E 's/(.*)[_-]([vV]{0,1}.*)(.tar.gz|.zip|.tgz)/\1 \2/'`
		distn=${distinfo% *}
		distv=${distinfo#* }
		newver=`grep "^$distn	" $cpanlistfile|cut -f2|sort -r|head -n1`
		if [ "$distv" != "$newver" ];then
			echo $o-$distv-$newver-$maint
			if [ -n "" ];then
				cd ~/bsdevel/upact/
				tdir=`env TMPDIR=. mktemp -d -t $n`
				$pcvs co -d $tdir $n
				cd $tdir
				portlint -a > txt.portlint.old
				sed -i.bak -Ee "/^PORTVERSION=/s|[0-9].*|$newver|" Makefile
				sed -i.bak -Ee '/^PORTREVISION=/d' Makefile
				rm *.bak
				make makesum
				newdistinfo=`cat distinfo*|grep -m1 SIZE`
				newdistinfo=${newdistinfo#*(}
				newdistinfo=${newdistinfo%)*}
				newdistfile=$newdistinfo
				echo "ardiff /usr/distfiles/$distfile /usr/distfiles/$newdistfile" > txt.ardiff.sh
				$pcvs di . > txt.pcvs.diff
				portlint -a > txt.portlint.new
			fi
		fi
	fi
done
