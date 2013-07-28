#!/bin/sh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export MM_CHARSET=UTF-8
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/ports/Tools/scripts:/usr/local/zvq/sbin:/usr/local/zvq/bin:$HOME/bin
export DISPLAY=:0
xrandr --output default --mode 1440x900
xset r off
daemon -f xrdb -display :0 -merge < ~/.Xresources
daemon -f xmodmap -display :0 ~/.xmodmaprc
daemon -f xbindkeys
daemon -f xsetroot -gray
daemon -f urxvt.sh
daemon -f firefox -no-remote -P default
exec dwm
