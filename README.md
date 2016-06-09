# Installation

```
git clone https://github.com/aliev/vim.git ~/.vim && echo "source ~/.vim/vimrc" > ~/.vimrc
vim
```

For neovim users:

```
mkdir -p ~/.config/nvim/
touch ~/.config/nvim/init.vim
echo "source ~/.vim/vimrc" > ~/.config/nvim/init.vim
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

# Vimrc files

Initial for this configuration (vim, neovim)

```
~/.vimrc, ~/.config/nvim/init.vim
```

This configuration directory with plugins and vimrc

```
~/.vim
```

Project specific options:

```
~/some/project/path/.exrc
```

Local settings and local plugin list

```
~/.vimrc.local
```

Local settings should be as follows

```
if g:local_plugins
  " Plugins list here
endif

if g:local_settings
  " Settings here
endif
```
