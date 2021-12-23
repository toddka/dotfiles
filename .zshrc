# installs
if [ -f "$HOME/install.sh" ]; 
then
    ~/install.sh;
else
    ~/dotfiles/install.sh;
fi

# visuals
set -o vi
export VISUAL=vim
export EDITOR="$VISUAL"
export TERM=xterm-256color

# fix: perl locale errors
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8

# source aliases
. ~/.aliases

# source functions
. ~/.functions

# fuzzy searching
export FZF_BASE=/path/to/fzf/install/dir

# oh my zsh
export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"
plugins=(fzf)
SPACESHIP_VI_MODE_SHOW=false
source $ZSH/oh-my-zsh.sh

# TODO: not sure if this is useful for anything
# autoload -U promptinit; promptinit
# prompt spaceship
