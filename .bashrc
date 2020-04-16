export PATH=/usr/bin:/usr/local/bin:$PATH


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /Users/todd/code/lola-server/venv/bin/activate.sh
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib:$PATH"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

source /Users/todd/Library/Preferences/org.dystroy.broot/launcher/bash/br

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
