#!/bin/bash


# echo "Type the year that you want to check (4 digits), followed by [ENTER]:"

# read year

# if (( ("$year" % 400) == "0" )) || (( ("$year" % 4 == "0") && ("$year" % 100 !=
# "0") )); then
#   echo "$year is a leap year."
# else
#   echo "This is not a leap year."
# fi




echo "Type server, followed by [ENTER]:"
read server


# echo "ssh root@$server"
# echo "Type serverpassword, followed by [ENTER]:"
# read serverpassword


# echo "Type usename, followed by [ENTER]:"

# read  username
# echo "Type password, followed by [ENTER]:"
# read password

# echo "Type databasename, followed by [ENTER]:"

# read databasename

# echo "Type tablename  from where data will be fetch, follw by [ENTER]:"

# read tablename
# mysql -u "$username" -p"$password" "$databasename" <<EOF
# select *  from employee;
#      EOF

ssh root@"$server"




