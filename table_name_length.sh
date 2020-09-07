#!/bin/bash

date=$(date '+%Y%m%d')
#Name that adds to the original table name to become new table name
temp_name="${date}"

#Name that adds to the original table name to become a middle temp name
temp_name_mid="${date}_temp"

table_name=$(echo "$1" | awk -F '","' '{print $1}')
column_name=$(echo "$1" | awk -F '","' '{print $2}')
column_type=$(echo "$1" | awk -F '","' '{print $3}')

#echo ${#table_name}

touch table_name_big.csv
touch table_name_small.csv


if [ ${#table_name} -ge 60 ]
then
echo $1 >> table_name_big.csv
else
echo $1 >> table_name_small.csv
fi

