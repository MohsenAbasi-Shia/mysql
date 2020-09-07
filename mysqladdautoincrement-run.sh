#!/bin/bash
while read line;
do
. ./mysqladdautoincrement.sh $line;
echo "--------------------------";
done < tables.txt
