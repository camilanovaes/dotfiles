#!/bin/bash
set -e
apt update && apt install -y git python3
git clone https://github.com/camilanovaes/my-dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.py all
