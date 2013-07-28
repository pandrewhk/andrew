#!/bin/sh

IFS='
'
echo "use sm4cc;"
mysql -B -e "select table_name\
	from information_schema.tables\
	where table_schema='sm4cc' and table_collation='latin1_swedish_ci';"|\
	tail -n +2|\
while read row;do
	tab=`echo $row|cut -f1`
	echo "alter table \`$tab\` character set cp1251;"
done
