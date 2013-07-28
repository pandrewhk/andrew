#!/bin/sh

exec 2>&-
grep "$1" /usr/ports/INDEX-8|cut -f2 -d'|'|\
while read a;do
	cat $a/*distinfo*|grep SIZE|cut -f2 -d\(|cut -f1 -d\)
done|sort -u
