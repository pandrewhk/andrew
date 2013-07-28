#!/bin/sh

if [ -z "$1" ];then
	echo "Usage: $0 ... <special> <node>"
	exit 1
fi


t="$*"
t=${t% *}
disk=${t##* }

id=`file -sk $disk`


case "$id" in
	*ext2*|*ext3*|*ext4*) mount -t ext2fs -o ro $@; break ;;
#	*FAT*) mount -t msdosfs -o ro,large $@; break ;;
	*FAT*) break ;;
	*) mount $@; break ;;
esac
