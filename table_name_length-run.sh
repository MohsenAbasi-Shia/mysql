#!/bin/bash
while read line;
do
line=$(echo -e $line | sed 's/^[" \t]*//;s/[" \t]*$//')
#echo $line
. ./table_name_length.sh $line;
done < $1
