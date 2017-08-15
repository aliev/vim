# Installation

This vimrc supports only Vim 8 because of async jobs and [package manager](https://shapeshed.com/vim-packages/)

If you want only configuration file you should use [vimrc](http://github.com/aliev/vimrc) plugin.

```
git clone https://github.com/aliev/vim.git ~/.vim
git submodule update --init --recursive
```

Update all plugins to latest version

```
git submodule foreach git pull origin master
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
