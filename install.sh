#!/bin/sh

# Add symlinks if the git `config` alias isn't being used (see README.md)
if ! command -v config &> /dev/null
then
    # TODO: do this more elegantly
    ln -s -f ~/dotfiles/.zshrc ~/.zshrc
    ln -s -f ~/dotfiles/.aliases ~/.aliases
    ln -s -f ~/dotfiles/.functions ~/.functions
    ln -s -f ~/dotfiles/.tmux.conf ~/.tmux.conf
    ln -s -f ~/dotfiles/.tmux.conf.local ~/.tmux.conf.local
    ln -s -f ~/dotfiles/.vimrc ~/.vimrc
    ln -s -f ~/dotfiles/.gitconfig ~/.gitconfig
fi

# Install packages
if [ -f "$HOME/.dotfiles-installed-flag" ]; then
    echo "Already installed dotfile deps."
    echo "Run rm \"$HOME/.dotfiles-installed-flag\" to re-run installs."
    exit 1
fi

touch "$HOME/.dotfiles-installed-flag"

## OS-specific installs
case "$(uname -s)" in
   Darwin)
     # fzf
     brew install fzf
     ## To install useful key bindings and fuzzy completion:
     $(brew --prefix)/opt/fzf/install
     ;;

   Linux)
     # fzf
     git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
     echo "y y n" | ~/.fzf/install
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     echo 'dotfile install failed: Windows not supported'
     ;;

   *)
     echo 'dotfile install failed: Unable to identify OS'
     ;;
esac

## Other installs

### oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ -f "$HOME/.zshrc.pre-oh-my-zsh" ]; then
    # hack to undo oh-my-zsh installation's zshrc overwrite.
    rm -rf "$HOME/.zshrc"
    mv "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc"
fi

#### oh-my-zsh spaceship
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"
