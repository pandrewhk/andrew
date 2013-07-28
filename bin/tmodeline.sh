#!/bin/sh

rand=`jot -rc 8 a z|rs -g 0`
xrandr --newmode $rand "$@"
xrandr --addmode VGA-0 $rand
xrandr --output VGA-0 --mode $rand
