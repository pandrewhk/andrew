#!/bin/sh

xrdb -merge < ~/.Xresources

urxvt -e vim "$@"
