#!/bin/sh

# perl -MHTML::Entities -0777 -npe 's,\n\n\n+,LINEBR,msg;s,\n\n,\n,g;s,LINEBR,\n\n,g;encode_entities($_)'

block=''
while read line;do
	if [ -z "$line" ]; then
		if [ -z "$block" ]; then
			continue
		fi
		echo '<div class="slide titlepage">'
		echo "$block"
		echo '</div>'
		block=''
	elif [ -z "$block" ]; then
		block="  <h1>$line</h1>"
	else
		block="$block
  <h2>$line</h2>"
	fi
done
