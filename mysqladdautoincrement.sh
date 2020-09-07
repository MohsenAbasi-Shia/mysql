#!/bin/bash
echo "create table  ${1}_temp110temp like $1;"

echo "insert into ${1}_temp110temp select * from $1 group by id;"

echo "alter table $1 rename to ${1}_temp110;"

echo "alter table ${1}_temp110temp rename to $1;"

echo "alter table $1 add primary key (id);"

echo "alter table $1 modify column id bigint auto_increment;"
