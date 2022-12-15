#!/bin/bash

clear
#------------------------------------------------------------
#generate ssh-keygen
if [ -f ~/.ssh/id_rsa ]; then
	echo -e "SSH key ~/.ssh/id_rsa already exists, using it"
else
	echo -e "Generating SSH key ~/.ssh/id_rsa"
	ssh-keygen
fi

#show ssh-keygen
echo -e "\nHere is your public key:\n"
echo -e "-----------------\n"
cat ~/.ssh/id_rsa.pub
echo -e "-----------------\n"

#open 42 intra ssh settings page and github ssh settings
read -p "Go to intra and github ssh page? [y/N]" input
if [ "$input" = "y" ]; then
	open 'https://profile.intra.42.fr/gitlab_users'
	open 'https://github.com/settings/keys'
fi

#------------------------------------------------------------
echo -e "\n"
read -p "git config --global user.name: " username
read -p "git config --global user.email: " useremail

#git username and user email config
if [[ "$username" != "" && "$useremail" != "" ]]; then
	git config --global --unset user.name
	git config --global --unset user.email
	git config --global user.name $username
	git config --global user.email "$useremail"
	echo -e "\nusername and useremail configired\n";
else
	echo -e "\nuser.name or user.email wrong\n";
fi

#yeaktas