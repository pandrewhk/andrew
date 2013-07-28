#!/bin/sh
while true; do
	ssh -n user@127.0.0.1 screen -x sat/sess
	echo Sleeping for 7 seconds before retrying...
	sleep 7
	echo Retrying...
done
