#!/usr/bin/env bash
#
# setup.sh	Define functions for the install.sh script
#
# Author: Camila Novaes <novaes.csw@gmail.com>
#

# Variables
USER=$(id -u -n 1000)

# Functions
#
# Verify if OS is Debian
verify_os(){
	cat /etc/os-release | grep '^NAME' | grep 'Debian' 1> /dev/null 2>&1

	if [ $? = 0 ]; then
		return 0
	else
		echo -e "\e[1;31m   x-x System not supported!  \e[0m"
		exit 1
	fi
}

# Install the list of packages 
# 
# Takes a file path as argument and install all the packages
# listed in the file.
#
# $1 - Path to the file with the packages to be installed
# 
# Example:
#	installPackages /path/to/the/file
#
install_packages() {
	echo -e "\e[1;33m   |-| Install system packages... $f  \e[0m"

	while read line;
	do
		sudo apt update
		sudo apt install -y $line
	done < $1
}

# Change Debian source list
#
# $1 - Path to the new source list
#
change_source_list() {
	echo -e "\e[1;33m   |-| Change source list... $f  \e[0m"

	sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
	sudo cp $1 /etc/apt/sources.list
}

# Configure dotfiles using stow
#
# $1 - Directory with dotfiles
#
config_dotfiles() {
	echo -e "\e[1;33m   |-| Configure dotfiles... $f  \e[0m"

	for f in $(ls $1); do
		if [ -d "$1/$f" ]; then

			stow -d $1 -t /home/$USER $f

			if [ $? = 0 ]; then
				echo -e "\e[1;34m   |-- [OK] $f  \e[0m"
			else
				echo -e "\e[1;31m   |-- [ERROR] $f  \e[0m"
			fi
		fi
	done
}

# Remove the zshrc file
config_zsh() {
	echo -e "\e[1;33m   |-| Configure ZSH... $f  \e[0m"

	# Make sure zsh is installed
	[ ! -x "$(which zsh)" ]	&& {
		echo -e "\e[1;31m   x-x ZSH not installed! $f  \e[0m"
		echo -e "\e[1;33m   |-- Install ZSH... $f  \e[0m"
		sudo apt install zsh
	}

	# Install oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# The oh-my-zsh will move the .zshrc to .pre-oh-my-zsh
	mv /home/$USER/.zshrc /home/$USER/.post-dotfiles-zsh
}

# Configure AMD
config_amd(){
	if [ ! -d "/etc/X11/xorg.conf.d/" ]; then
		mkdir -p /etc/X11/xorg.conf.d/
	fi

	sudo cp $(pwd)/config/20-amdgpu.conf /etc/X11/xorg.conf.d/20-amdgpu.conf
}
