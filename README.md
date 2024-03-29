# To edit dotfiles on a new machine...
```
git clone --bare https://github.com/toddka/dotfiles $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
This is mainly useful for main dev machines where symlinking isn't ideal. On containers,
`install.sh` will create symlinks for listed files.

Fix ZSH funkiness [on OSX](https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/).
