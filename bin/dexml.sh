cat "$@"|perl -00 -npe 's/<.*?>//sg'|fmt -ps 999999|grep -v '^$'
