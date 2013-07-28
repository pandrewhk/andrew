#!/bin/sh

IFS='
'
echo "use sm4cc;"
mysql -B -e "select table_name,column_name,column_default,is_nullable,column_type\
	from information_schema.columns\
	where table_schema='sm4cc' and character_set_name='latin1';"|\
	tail -n +2|\
while read row;do
	tab=`echo $row|cut -f1`
	col=`echo $row|cut -f2`
	def=`echo $row|cut -f3`
	nul=`echo $row|cut -f4`
	typ=`echo $row|cut -f5`
#	echo $tab $col $def $nul $typ
	nulq=""
	[ "$nul" = "YES" ] || nulq="NOT NULL"
	defq="default '$def'"
	[ "$def" != "NULL" ] || if [ "$nul" = "YES" ];then
		defq="default $def"
	else
		defq=""
	fi
	echo "alter table \`$tab\` modify \`$col\` $typ character set binary $nulq $defq;"
	echo "alter table \`$tab\` modify \`$col\` $typ collate cp1251_general_ci $nulq $defq;"
done
