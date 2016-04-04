[My blog post about this vim configuration and installation](http://bit.ly/1NzFrBK)

[Fonts: I use this one](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DroidSansMono/complete)

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

# What included?

* [vim-plug](https://github.com/junegunn/vim-plug)
* [NERDTree](https://github.com/scrooloose/nerdtree)
* [NERDTree git plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
* [Vim Fugitive](https://github.com/tpope/vim-fugitive)
* [BufTabLine](https://github.com/ap/vim-buftabline)
* [Tmux focus events](https://github.com/tmux-plugins/vim-tmux-focus-events)
* [FZF](https://github.com/junegunn/fzf)
* [FZF.vim](https://github.com/junegunn/fzf.vim)
* Vimrc: [~/.vim/vimrc](https://github.com/aliev/vim/blob/master/plugin/settings/statusline.vim)
* Local vimrc example: [~/.vimrc.local](https://github.com/aliev/dotfiles/blob/master/.vimrc.local)
* Keymaps with description: [~/.vim/plugin/settings/keymap.vim](https://github.com/aliev/vim/blob/master/plugin/settings/keymap.vim)
* Simple statusline: [~/.vim/plugin/settings/statusline.vim](https://github.com/aliev/vim/blob/master/plugin/settings/statusline.vim)
* My Tmux config: [~/.tmux.conf](https://github.com/aliev/dotfiles/blob/master/.tmux.conf)
