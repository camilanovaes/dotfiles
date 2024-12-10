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
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_SCRIPT=$HOME/.local/bin/virtualenvwrapper.sh
source $HOME/.local/bin/virtualenvwrapper_lazy.sh

# Add local bin to path
path+=('/home/camila/.local/bin')
path+=('/usr/local/go/bin')
path+=('/home/camila/go/bin')
path+=('/home/camila/.cargo')
path+=('/home/camila/projects/parallel-compute/ispc-v1.21.0-linux/bin')
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
alias mibdump.py="mibdump"
alias docker-gui="docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix"

# Keybinds
bindkey -s "^f" "tmux-session\n"
bindkey -s "^g" "tmux-switcher\n"
bindkey -s "^b" "git-branch-switcher\n"
