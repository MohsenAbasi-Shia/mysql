#!/bin/bash

line=$(echo -e $1 | sed 's/^[" \t]*//;s/[" \t]*$//')

date=$(date '+%Y%m%d')

################################################################################
#Name that adds to the original table name to become new table name

#small table names
#temp_name="${date}"

#large table names
temp_name="d"

################################################################################
#Name that adds to the original table name to become a middle temp name

#small table names
#temp_name_mid="${date}_temp"

#small table names
temp_name_mid="t"


table_name=$(echo "$line" | awk -F '","' '{print $1}')
column_name=$(echo "$line" | awk -F '","' '{print $2}')
column_type=$(echo "$line" | awk -F '","' '{print $3}')

#echo table=$table_name

echo "create table if not exists  ${table_name}_${temp_name} like ${table_name};"
echo "insert into ${table_name}_${temp_name} select * from ${table_name} group by ${column_name};"
echo "drop table if exists ${table_name}_${temp_name_mid};"
echo "alter table ${table_name} rename to ${table_name}_${temp_name_mid};"
echo "alter table ${table_name}_${temp_name} rename to ${table_name};"
echo -e "alter table ${table_name} DROP INDEX IF EXISTS \`PRIMARY\`, add primary key (${column_name});"
echo "alter table ${table_name} modify column ${column_name} ${column_type} auto_increment;"
