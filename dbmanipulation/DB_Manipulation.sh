#!/bin/bash -e
#
# Database & Table Search Linux Shell Scripting
#
# Written By Ravi Kumar
#
# Put your HostName
echo "Enter your Hostname : "
read -e dbhostname
# Put your DatabaseUserName
echo "Enter your Username : "
read -e user
#
#
#
# SHOW DATABASES AFTER LOGIN
mysql -h $dbhostname -u $user -p -e "show databases"

# PROCESS TO SEARCH ANY TABLE
echo -n "If you need to search any table in database? (y/n)"
read run
#echo $run
if [ "$run" == y ] ; then
	echo "Enter your database name"
	read -e dbname
	echo "Enter your table name"
	read -e table_name
else
	echo "Thanks for Database Login!"
fi
	echo "Enter your database password to check exist or not!"
# CHECK TABLE EXIST OR NOT IN DATABASE
if [ $(mysql -N -s -u $user -p -e \
    "select count(*) from information_schema.tables where \
        table_schema='$dbname' and table_name='$table_name';") -eq 1 ]; then
	echo "table $table_name exist!"
# SHOW RECORDS OF SELECTED TABLE
	echo "Enter your database password to view the records of $table_name!"
mysql -N -s -u $user -p -e "select * from $dbname.$table_name;"
else
	echo "table $table_name does not exist!"

fi
