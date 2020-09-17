# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin
export PATH=/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH="$PATH:/Users/todd/.local/bin:/.local/bin"

 #Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=()
# git - removed this in favor of tmux
source $ZSH/oh-my-zsh.sh
DEFAULT_USER="todd"
source /Users/todd/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. ~/.aliases # source a cleanly maintained alias file

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
# source /Users/todd/code/lola-server/venv/bin/activate.sh

export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

source /Users/todd/Library/Preferences/org.dystroy.broot/launcher/bash/br
CONFIG_PATH=$HOME/.zshrc

function kexec() {
    if [ -z "$1" ]; then
        echo "please specify a pod name... kexec [pod [cmd [container]]]"
        k get pods
        return 1
    fi
    if [ -z "$2" ]; then
        cmd=/bin/bash
        echo "defaulting to cmd=$cmd"
    else
        cmd="$2"
    fi
    if [ -z "$3" ]; then
        container=""
    else
        container="-c $3"
    fi
    pod=$(k get pods | rg Running | rg $1 | awk '{print $1}' | head -n 1)
    echo "using pod=$pod"
    k exec $pod $container -it $cmd
}

gd() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

# Z cmd utility to auto jump to directories
. /usr/local/bin/z.sh
eval "$(direnv hook zsh)"

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'

# Add fuzzy search to zsh
export FZF_DEFAULT_COMMAND="fd --hidden --exclude '*migrations'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(pyenv init -)"

