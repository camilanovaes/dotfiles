#!/usr/bin/env bash
#
# setup.sh	Define functions for the install.sh script
#
# Author: Camila Novaes <novaes.csw@gmail.com>
#

# Variables
USER=$(id -u -n 1000)
SOFTWARE_DIR="/home/$USER/Software"

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
# listed in the file. Besides that, also install external packages (e.g., .deb)
#
# $1 - Path to the file with the packages to be installed
# 
# Example:
#	install_packages /path/to/the/file
#
install_packages() {
	echo -e "\e[1;33m   |-| Install system packages... \e[0m"

	# Install packages using apt
	sudo apt update
	while read line;
	do
		echo -e "\e[1;33m   |-- Install $line...  \e[0m"
		sudo apt install -y $line
	done < $1

	# Install appimages and deb apps
	__install_appimagerlauncher
	__install_zotero
	__install_todoist
}

# Change Debian source list
#
# $1 - Path to the new source list
#
change_source_list() {
	echo -e "\e[1;33m   |-| Change source list... \e[0m"

	sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
	sudo cp $1 /etc/apt/sources.list
}

# Configure dotfiles using stow
#
# $1 - Directory with dotfiles
#
config_dotfiles() {
	echo -e "\e[1;33m   |-| Configure dotfiles... \e[0m"

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
	# FIX: not stop the script to enter the default shell
	echo -e "\e[1;33m   |-| Configure ZSH... \e[0m"

	# Make sure zsh is installed
	[ ! -x "$(which zsh)" ]	&& {
		echo -e "\e[1;31m   x-x ZSH not installed! \e[0m"
		echo -e "\e[1;33m   |-- Install ZSH... \e[0m"
		sudo apt install zsh
	}

	# Install oh-my-zsh
	echo -e "\e[1;33m   |-- Install oh-my-zsh... \e[0m"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

	# Check if already exist a .zshrc file
	[ -e "/home/$USER/.zshrc" ] && {
		mv /home/$USER/.zshrc /home/$USER/.post-dotfiles-zsh
	}

	# Install the plugins
	#
	echo -e "\e[1;33m   |-- Install zsh plugins: autosuggestion and fzf... \e[0m"
	## Autosuggestion
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	
	## FZF
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --no-zsh --no-bash --completion --key-bindings

  # Set ZSH as the default shell
  chsh -s $(which zsh)
}

# Configure AMD
config_amd(){
	if [ ! -d "/etc/X11/xorg.conf.d/" ]; then
		mkdir -p /etc/X11/xorg.conf.d/
	fi

	sudo cp $(pwd)/config/20-amdgpu.conf /etc/X11/xorg.conf.d/20-amdgpu.conf
}

config_nvim() {
	# TODO: Download packer and pyright and install all plugins
}

config_python_env() {
	# TODO: Download and setup virtuelenvwrapper
}

__check_software_dir() {
	[ ! -d "$SOFTWARE_DIR" ] && {
		mkdir -p "$SOFTWARE_DIR"
	}
}

__install_neovim(){
  sudo dpkg -i --force-overwrite $1
  sudo apt -f install
}

# Download ans setup appimage app
__install_appimagerlauncher() {
	soft_name="AppImageLauncher"

	echo -e "\e[1;33m   |-- Install $soft_name...  \e[0m"

	# Add appimage PPA
	sudo add-apt-repository ppa:appimagelauncher-team/stable
	sudo apt update
	sudo apt install appimagelauncher

	if [ $? = 0 ]; then
		echo -e "\e[1;34m   |-- [OK] $soft_name  \e[0m"
	else
		echo -e "\e[1;34m   |-- [ERROR] $soft_name  \e[0m"
	fi
}

# Download ans setup zotero app
__install_zotero() {
	soft_name="Zotero"
	zotero_location="https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=5.0.96.3"

	echo -e "\e[1;33m   |-- Install $soft_name...  \e[0m"

	__check_software_dir

	# Download zotero and extract
	curl -L -o $SOFTWARE_DIR/zotero.tar.bz2 $zotero_location 1> /dev/null 2>&1
	[ $? = 0] && echo -e "\e[1;34m   |-- Downloaded $soft_name...  \e[0m"

	tar -xjf $SOFTWARE_DIR/zotero.tar.bz2 -C $SOFTWARE_DIR 
	[ $? = 0] && echo -e "\e[1;34m   |-- Extracted $soft_name...  \e[0m"

	extract_folder=$(tar -tf $SOFTWARE_DIR/zotero.tar.bz2 | head -1 | sed -e 's/\/.*//') 

	# Set launcher icon
	zotero_app_path="$SOFTWARE_DIR/$extract_folder/zotero.desktop"
	zotero_desktop_path="/usr/share/applications/zotero.desktop"

	# Update the .dekstop file
	bash $SOFTWARE_DIR/$extract_folder/set_launcher_icon

	# Set GTK theme
	if [ -e $zotero_app_path ]; then
		sed -i 's/Exec=/Exec=env GTK_THEME=Adwaita:light /' $zotero_app_path
	else
		echo -e "\e[1;31m   |--- [ERROR] $soft_name desktop not found!  \e[0m"
		return 1
	fi

	# TODO: Download and install zotero plugins

	# Set symlink to zotero.desktop
	sudo ln -s $zotero_app_path $zotero_desktop_path

	if [ $? = 0 ]; then
		echo -e "\e[1;34m   |-- [OK] $soft_name  \e[0m"
	else
		echo -e "\e[1;34m   |-- [ERROR] $soft_name  \e[0m"
	fi

}

# Download and install Todoist
__install_todoist() {
	soft_name="Todoist"
	todoist_loc="https://todoist.com/linux_app/appimage"

	echo -e "\e[1;33m   |-- Install $soft_name...  \e[0m"

	__check_software_dir

	# Download and install
	curl -L -o $SOFTWARE_DIR/todoist.AppImage $todoist_loc 1> /dev/null 2>&1
	[ $? = 0] && echo -e "\e[1;34m   |-- Downloaded $soft_name...  \e[0m"

	AppImageLauncher $SOFTWARE_DIR/todoist.AppImage
}

# Download and install brave browser
__install_brave() {
	soft_name="Brave"

	echo -e "\e[1;33m   |-- Install $soft_name...  \e[0m"

	# Add PPA and install
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	sudo apt install brave-browser

	if [ $? = 0 ]; then
		echo -e "\e[1;34m   |-- [OK] $soft_name  \e[0m"
	else
		echo -e "\e[1;34m   |-- [ERROR] $soft_name  \e[0m"
	fi
}

