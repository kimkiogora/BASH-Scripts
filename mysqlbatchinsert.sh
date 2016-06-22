#!/usr/bin/sh

x=1
while [ 1 ];do
let x=x+1
query="insert into table (values) values ($x,value1...valueN);"
echo $query>x.sql
mysql -uroot -pr00t your_db < otb.sql
rm -rf x.sql
sleep 1
done
