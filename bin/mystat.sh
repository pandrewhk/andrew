#!/bin/sh

echodo(){ echo % "$@"; eval "$@"; }
echodo clear
echodo top -n 14\|cut -c-80\|grep -v '^$'
echodo uname -a
echodo stty -a\|grep rows
echodo 'for i in ja_JP ko_KR ru_RU; do env LANG=$i.UTF-8 date; done'
echodo 'pkg_info -EX "(zsh|rxvt|liber)"'
