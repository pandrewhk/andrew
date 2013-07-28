#!/bin/sh
while [ $# -ge 1 ];do
   flvfile=$1
   shift
   base=${flvfile%.flv}
   avifile=$base.avi
   mkvfile=$base.mkv
   if [ -s $mkvfile ];then
      continue
   fi
   rm -f $avifile $mkvfile
   ffmpeg -i $flvfile -vcodec copy -acodec copy -y $avifile
   mkvmerge -o $mkvfile $avifile
   rm $avifile
done
