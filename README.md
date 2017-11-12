# Installation

If you want only configuration file you should use [vimrc](http://github.com/aliev/vimrc) plugin.

```
git clone git@github.com:aliev/vim.git ~/.vim
echo "source ~/.vim/vimrc" > ~/.vimrc
cd ~/.vim
git submodule update --init --recursive
```

Tools: Ag, exuberant ctags

```
# OS X
brew install the_silver_searcher
brew install ctags-exuberant


# Ubuntu
sudo apt-get install exuberant-ctags
sudo apt-get install silversearcher-ag
```
