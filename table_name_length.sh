#!/bin/bash

#echo "param=$1"
line=$(echo -e $1 | sed 's/^[" \t]*//;s/[" \t]*$//')

date=$(date '+%Y%m%d')
#Name that adds to the original table name to become new table name
temp_name="${date}"

#Name that adds to the original table name to become a middle temp name
temp_name_mid="${date}_temp"

table_name=$(echo "$line" | awk -F '","' '{print $1}')
column_name=$(echo "$line" | awk -F '","' '{print $2}')
column_type=$(echo "$line" | awk -F '","' '{print $3}')

table_name=$(echo "${table_name}_${temp_name_mid}")
#echo ${#table_name}

limit=59
len=${#table_name}

#echo "$1"
#echo "$table_name"
#echo "$len"
#echo "$limit"
#echo "----------"

if (( $len>$limit ))
then
	echo "$1" >> table_name_big.csv
else
	echo "$1" >> table_name_small.csv
fi

