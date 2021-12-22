#!/bin/sh
if [ -f "$HOME/.dotfiles-installed-flag" ]; then
    echo "Already installed dotfile deps."
    echo "Run rm \"$HOME/.dotfiles-installed-flag\" to re-run installs."
    exit 1
fi

touch "$HOME/.dotfiles-installed-flag"

# OS-specific installs
case "$(uname -s)" in
   Darwin)
     # fzf
     brew install fzf
     ## To install useful key bindings and fuzzy completion:
     $(brew --prefix)/opt/fzf/install
     ;;

   Linux)
     # fzf
     sudo apt-get install fzf
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     echo 'dotfile install failed: Windows not supported'
     ;;

   *)
     echo 'dotfile install failed: Unable to identify OS'
     ;;
esac

# Other installs

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## oh-my-zsh spaceship
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"