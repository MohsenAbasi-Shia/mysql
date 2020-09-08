#!/bin/bash

rm -rf table_name_big.csv
rm -rf table_name_small.csv

touch table_name_big.csv
touch table_name_small.csv

while read line;
do
#echo "$line"
. ./table_name_length.sh "$line";
done < $1
