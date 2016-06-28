sudo echo "
welcome to  TEST
"
echo  "Please give your mysql user:"
read muser
echo  "Please give your mysql database name you want to create:"
read mpass
mysql -u $muser -p -e "create database $mpass;"
mysql -u $muser -p 

