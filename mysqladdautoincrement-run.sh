#!/bin/bash
while read line;
do
line=$(echo -e $line | sed 's/^[" \t]*//;s/[" \t]*$//')
#echo $line
. ./mysqladdautoincrement.sh $line;
echo "--------------------------";
done < $1
