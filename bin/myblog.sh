#!/bin/sh

if [ -n "$1" ]; then
	echo "…" > ~/myblog.tmp && \
	echo "$*" >> ~/myblog.tmp && \
	scp ~/myblog.tmp heka:b/`date '+%Y%m%d-%H%M'`.txt
	twiget.sh "$*"
else
	exec vim scp://heka/b/`date '+%Y%m%d-%H%M'`.txt
fi
