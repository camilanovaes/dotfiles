# ZSH CONFIG FILE
# Author: Camila Novaes <novaes.csw@gmail.com>

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH Theme
ZSH_THEME="bira"

# Plugins
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export LC_CTYPE=en_US.UTF-8

# TMUX
export DISABLE_AUTO_TITLE='true'

# VirtualEnvWrapper configuration
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.11
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

# Add local bin to path
path+=('/home/camila/.local/bin')
export PATH

# FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alias
## Git
alias gs="git status"
alias ga="git add"
alias gc="git commit -v"
alias gl="git l"
alias gp="git pull"
alias gf="git fetch -a"

# Keybinds
bindkey -s "^f" "tmux-session\n"
bindkey -s "^g" "tmux-switcher\n"
