#!/bin/bash
while read line;
do
#echo $line
. ./mysqladdautoincrement.sh $line;
echo "#--------------------------";
done < $1
