#!/bin/sh
while [ $# -ge 1 ];do
   flvfile=$1
   shift
   base=${flvfile%.flv}
   avifile=$base.avi
   rm -f $avifile
   ffmpeg -i $flvfile -vcodec copy -acodec copy -y $avifile
done
