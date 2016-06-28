#!/bin/bash
#Change the file permission

echo -n "Enter permission > "
read permission


echo -n "Enter foldername > "
read foldername 


folder=$(find "$(cd ..; pwd)" -name "$foldername") 
chmod -R "$permission" "$folder"