## Description

Minimal VIM configuration file based on KISS principle

## How to install?

```
cd ~
git clone https://github.com/aliev/vim.git
mv ~/vim ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "source ~/.vim/vimrc" > .vimrc
vim +BundleInstall +qall # Install all plugins
# installation YouCompleteMe plugin
cd ~/.vim/bundle/YouCompleteMe
./install.sh
```

## Screenshots

![vim indent guides](https://raw.github.com/aliev/vim/master/vim.png "Vim with indent guides and trailing characters")

## Important

If jedi-vim autocomplete doesn't work correctly, you can upgrade you vim to latest version (currently 7.4), or disable ```g:airline#extensions#tabline#enabled``` option in your vimrc file

## For MacVim users
Plaease read: https://github.com/Valloric/YouCompleteMe#i-have-a-homebrew-python-andor-macvim-cant-compilesigabrt-when-starting

## Key bindings

| Key        | Description
| ---------- |:---------------------------------------------------------------
| ,          | Default leader key
| leader + l | Enable (disable) displaying whitespace
| leader + f | Open CtrlP
| leader + b | Open CtrlPBuffer
| leader + e | NERDTree Toggle
| leader + c | Open jedi vim complete pop-up (insert mode)
| leader + g | goto definition
| leader + r | rename
| leader + n | find usage
| leader + d | goto assignments
| leader + t | create new tab
| leader + w | close buffer (tabe) with asking save
| leader + / | Comment selected line
