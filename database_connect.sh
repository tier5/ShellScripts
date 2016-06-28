#!/bin/bash

# connection database and fetching all values from a table that is specified by user

echo "Type usename, followed by [ENTER]:"

read  username
echo "Type password, followed by [ENTER]:"
read password

echo "Type databasename, followed by [ENTER]:"

read databasename

echo "Type tablename  from where data will be fetch, follw by [ENTER]:"

read tablename
mysql -u "$username" -p"$password" "$databasename" <<EOF
select *  from $tablename;
     EOF