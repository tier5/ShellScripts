# !/bin/bash -e
#createing unique folder to the local server
clear
flag=0

echo -n "Database Name: "
read  dbname
echo -n "Database User: "
read  dbuser
echo -n "Database Password: "
read  dbpass
#getting the project name
echo -n "Enter the folder name of the project: "
read folder_name
if [ -n "$folder_name" ]; then
cd /
cd /var/www/html
	if [  -d "$folder_name" ]; then
	 	echo "Already exist"
	 	until [ "$flag" -eq 1 ]
			do
		 echo -n "Enter the folder name: "
		 read folder_name
		 if [  ! -d "$folder_name" ]; then
		 	mkdir $folder_name
			echo "not exist creating one"
			flag=1
		 fi			  
			done
		 else

		 mkdir $folder_name
		 echo "not exist creating one"

	fi	

fi
cd "$folder_name/"
#download wordpress
curl -O https://wordpress.org/latest.tar.gz
#unzip wordpress
tar -zxvf latest.tar.gz
#change dir to wordpress
cd wordpress
#copy file to parent dir
cp -rf . ..
#move back to parent dir
cd ..
#remove files from wordpress folder
rm -R wordpress
#remove latest.tar.gz
rm latest.tar.gz
#create wp config
cp wp-config-sample.php wp-config.php
#set database details with perl find and replace
perl -pi -e "s/database_name_here/$dbname/g" wp-config.php
perl -pi -e "s/username_here/$dbuser/g" wp-config.php
perl -pi -e "s/password_here/$dbpass/g" wp-config.php

#set WP salts
perl -i -pe'
  BEGIN {
    @chars = ("a" .. "z", "A" .. "Z", 0 .. 9);
    push @chars, split //, "!@#$%^&*()-_ []{}<>~\`+=,.;:/?|";
    sub salt { join "", map $chars[ rand @chars ], 1 .. 64 }
  }
  s/put your unique phrase here/salt()/ge
' wp-config.php

#create uploads folder and set permissions
mkdir wp-content/uploads
chmod 775 wp-content/uploads
echo "Cleaning..."
echo "Download and initialization is complete."