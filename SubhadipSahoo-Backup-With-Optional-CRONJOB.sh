#!/bin/bash
#Purpose: Backup Desired Directory into Desired Destination Directory With Optional CRONJOB Setup
#Created on: 06-28-2016
#Author: Subhadip Sahoo
#Version 1.0
#Example command: ./SubhadipSahoo-Backup-With-Optional-CRONJOB /path/to/source/dir/ /path/to/destination/dir/
#START
TIME=`date +%b-%d-%y`            
FILENAME=backup-$TIME.tar.gz  
SRCDIR=$1                    
DESDIR=$2           
tar -cpzf $DESDIR/$FILENAME $SRCDIR
while true; do
    read -p "Do you like to set this into cron (y/n)?" yn
    case $yn in
        [Yy]* ) crontab -l > mycron
                echo "15 00 * * * cd /ShellScripts && sh s.sh $1 $2" >> mycron
                crontab mycron
                rm mycron
                sudo service apache2 restart
                while true; do
                    echo "Cron has been set to 12:15 AM on everyday."
                    read -p "Do you like to change the cron interval (y/n)?" yn
                    case $yn in
                        [Yy]* ) crontab -e
                                echo "After modifying please run the command sudo service apache2 restart"
                                break;;
                        [Nn]* ) exit;;
                        * ) echo "Please answer yes or no.";;
                    esac
                done
                break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
#END 