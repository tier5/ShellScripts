#!/bin/bash
#install Laravel 4 or 5 according to need
timestamp=$(date +%s)
echo "$(tput setaf 1)Don't be a dumbass type 4 or 5 $(tput sgr0)"
echo -n "$(tput setaf 1)Which version you wana install Laravel 4 or 5 tell me [ENTER]:$(tput sgr0)"
read version
if [ -n "$version" ]; then
	if(( ("$version" == 4) )); then
		echo "I m gonna install laravel 4.2 in ur fucking machine"
		echo -n "$(tput setaf 1)what should be the project folder name? [ENTER] : $(tput sgr0)"
		read folder_name
		if [ -n "$folder_name" ]; then
			cd /
			cd /var/www/html
			composer global require "laravel/installer"
			composer create-project laravel/laravel "$folder_name" 4.2 --prefer-dist
			cd "$folder_name/"
			chmod -R 777 public/
			chmod -R 777 bootstrap/
			chmod -R 777 app/storage/
			echo "hey ! your laravel 4. set up is done open <your host ip>/$folder_name/public"
		else
			cd /
			cd /var/www/html
			composer global require "laravel/installer"
			composer create-project laravel/laravel fresh_laravel4$timestamp 4.2 --prefer-dist
			cd "fresh_laravel4$timestamp/"
			chmod -R 777 public/
			chmod -R 777 bootstrap/
			chmod -R 777 app/storage/
			echo "hey ! your laravel 4. set up is done open <your host ip>/fresh_laravel4$timestamp/public"
		fi
	else
		echo "well user I m smart enough to find ur motivation as well"
		echo "I m gonna install laravel 5.1 in ur fucking machine"
		echo -n "$(tput setaf 1)what should be the project folder name? [ENTER] :$(tput sgr0)"
		read folder_name
		if [ -n "$folder_name" ]; then
			cd /
			cd /var/www/html
			composer global require "laravel/installer"
			export PATH="~/.composer/vendor/bin:$PATH"
			laravel new "$folder_name"
			#composer create-project laravel/laravel $folder_name "5.1.*"
			cd "$folder_name/"
			chmod -R 777 public/
			chmod -R 777 bootstrap/
			chmod -R 777 storage/
			echo "$(tput setaf 1)hey ! your laravel 5.2 set up is done open <your host ip>/$folder_name/public$(tput sgr0)"
		else
			cd /
			cd /var/www/html
			composer global require "laravel/installer"
			export PATH="~/.composer/vendor/bin:$PATH"
			#composer create-project laravel/laravel fresh_laravel$timestamp "5.1.*"
			laravel new "fresh_laravel$timestamp"
			cd "fresh_laravel$timestamp/"
			chmod -R 777 public/
			chmod -R 777 bootstrap/
			chmod -R 777 storage/
			echo "$(tput setaf 1)hey ! your laravel 5.2 set up is done open <your host ip>/fresh_laravel$timestamp/public$(tput sgr0)"
		fi
	
	fi

else
		echo "Fuck No ! I told you that I am smart enough"
		echo "I m gonna install laravel 5.1 in ur fucking machine"
		echo -n "$(tput setaf 1)what should be the project folder name? [ENTER] :$(tput sgr0)"
		read folder_name
		if [ -n "$folder_name" ]; then
			cd /
			cd /var/www/html
			#laravel new "$folder_name"
			composer global require "laravel/installer"
			export PATH="~/.composer/vendor/bin:$PATH"
			laravel new "$folder_name"
			#composer create-project laravel/laravel $folder_name "5.1.*"
			cd "$folder_name/"
			chmod -R 777 public/
			chmod -R 777 bootstrap/
			chmod -R 777 storage/
			echo "$(tput setaf 1)hey ! your laravel 5.2 set up is done open <your host ip>/$folder_name/public$(tput sgr0)"
		else
			cd /
			cd /var/www/html
			#laravel new "fresh_laravel$timestamp"
			composer global require "laravel/installer"
			export PATH="~/.composer/vendor/bin:$PATH"
			laravel new "fresh_laravel$timestamp"
			#composer create-project laravel/laravel fresh_laravel$timestamp "5.1.*"
			cd "fresh_laravel$timestamp/"
			chmod -R 777 public/
			chmod -R 777 bootstrap/
			chmod -R 777 storage/
			echo "$(tput setaf 1)hey ! your laravel 5.2 set up is done open <your host ip>/fresh_laravel$timestamp/public$(tput sgr0)"
		fi

fi
	
