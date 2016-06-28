 #!/bin/bash
clear
# Developed by Dibs
echo "Checking if java is installed..."

#DOWNLOADS="$HOME/Downloads"
#STUDIO_URL=http://dl.google.com/android/studio/install/0.3.2/android-studio-bundle-132.893413-linux.tgz
#echo $DOWNLOADS

CURRENT_VERSION=$(java -version)


if [ -n $CURRENT_VERSION ]; then
	#echo "Java installed..." 
	echo $CURRENT_VERSION
else
	echo "Java not installed, preparing to install JDK"

	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java8-installer

fi

#echo "Installing lib32ncurses5..."
#sudo apt-get install lib32ncurses5 ia32-libs 2>&1


sudo apt-add-repository ppa:paolorotolo/android-studio
sudo apt-get update
sudo apt-get install android-studio


