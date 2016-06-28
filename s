#!/bin/bash
#Author: Santanu
#Descripttion: This application will check all your modified files and untracked files and will commit your code. And also it'll merge your code to remote branch and push your code to remote branch.

while true; do
	echo "Welcome to our application.";
	echo "Please provide full path for your project folder.";
    read input__folder_path
    cd $input__folder_path
    echo "Here is your list of all branches.";
    git branch
    read -p "Do you to checkout to another branch? Press y/n" yn
    case $yn in
        [Yy]* ) echo "Please enter the branch name";
                read input_variable;
				branch_name=$(git symbolic-ref -q HEAD);
				echo $branch_name;
                git status --porcelain . >/dev/null 2>&1; ec=$?
		if test "$ec" = 0; then
			while true; do
			    read -p "Some untracked files are there. Press Yes to continue by adding all the files? Press y/n" yn 
			    case $yn in
	        		[Yy]* )
						#git diff --name-only
			    		#git ls-files --other --exclude-standard
			    		#git add [[ git diff --name-only ]]
			    		git add -A .
			    		echo "Please enter the commit message";
						read input_message
						git commit -m "$input_message";
						#git pull origin $branch_name;
						#git push origin $branch_name;
						git checkout $input_variable;
						echo "You are now on $input_variable branch."
						#echo "Thanks for using this application!!";
						#exit;;
						read -p "Do you to want merge this branch to another branch? Press y/n" yn
					    case $yn in
					        [Yy]* ) 
								echo "Please enter the branch name";
				                read input_new_branch;
								current_branch_name=$(git symbolic-ref -q HEAD);
								echo $current_branch_name;
				                git merge $input_new_branch;
								git pull origin $current_branch_name;
								git push origin $current_branch_name;
								echo "You have successfully pushed your code to remote branch!"
								echo "Thanks for using this application!!";
								exit;;
					        [Nn]* ) 
								echo 'Thanks for using this application!!'; 
								exit;;
					        * ) echo 'Please answer yes or no.';;
					    esac
				    	;;
					[Nn]* ) 
						echo 'Sorry we can not proceed further! You have to add all files';;
				    * ) 
						echo 'Please answer yes or no. Press y for Yes and n for No.';;
		    	esac
		    done
		elif test "$ec" = 1; then
		    echo no untracked files
		else
		    echo error from ls-files
		fi
		git checkout $input_variable; break;;
        [Nn]* ) echo "Thanks for using this application!!"; 
				exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
