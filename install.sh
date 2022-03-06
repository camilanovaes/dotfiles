#!/usr/bin/env bash
#
# install.sh	Install the packages and configure my dotfiles
#
# Author: Camila Novaes <novaes.csw@gmail.com>
# 

# Variables
SOURCE_LIST_PATH="$(pwd)/config/sources.list"
PKGS_FILE_PATH="$(pwd)/pkgs/debian.txt"
DOTFILES_FOLDER="$(pwd)/config"

# Load functions
source "$(pwd)/scripts/setup.sh"

echo -e "\e[1;33m   --- Starting installation process!  \e[0m"

# Execute
## Verify OS
verify_os

## Change source list
change_source_list $SOURCE_LIST_PATH

## Install packages
install_packages $PKGS_FILE_PATH

## Configure ZSH 
config_zsh

## Configure AMD driver
config_amd

## Configure dotfiles
config_dotfiles $DOTFILES_FOLDER
