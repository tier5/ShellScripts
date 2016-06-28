#!/bin/bash
echo "You can crete you Mysql database "
echo -n "Enter database name: "
read dbname
echo -n "Enter database username: "
read dbuser
echo -n "Enter database user password: "
read dbpw

db="create database $dbname;"
mysql -u $dbuser -p$dbpw -e "$db"

if [ $? != "0" ]; then
echo "[Error]: Database creation failed"
exit 1
else
echo "------------------------------------------"
echo " Database has been created successfully "
echo "------------------------------------------"
echo " DB Info: "
echo ""
echo " DB Name: $dbname"
echo " DB User: $dbuser"
echo " DB Pass: $dbpw"
echo ""
echo "------------------------------------------"
fi
