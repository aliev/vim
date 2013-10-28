## Description

Minimal VIM configuration file based on KISS principle

## Screenshots

![vim indent guides](https://dl.dropboxusercontent.com/u/5837324/vim/vim-indent-guides.png "Vim with indent guides and trailing characters")

![vim](https://dl.dropboxusercontent.com/u/5837324/vim/vim.png "Vim")

![python support](https://dl.dropboxusercontent.com/u/5837324/vim/vim-python.png "Python support")

## How to install?

```
cd ~
git clone https://github.com/aliev/vim.git
mv ~/vim ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "source ~/.vim/vimrc" > .vimrc
vim +BundleInstall +qall # Install all plugins
```

## Key bindings

| Key        | Description
| ---------- |:---------------------------------------------------------------
| ,          | Default leader key
| leader + l | Enable (disable) displaying whitespace
| leader + f | Open CtrlP
| leader + b | Open CtrlPBuffer
| leader + c | Open jedi vim complete pop-up (insert mode), Comment selected line (visual mode)
| leader + g | goto definition
| leader + r | rename
| leader + n | usage
| leader + d | goto assignments
| leader + t | create new tab
| leader + w | close buffer (tabe) with asking save
| C + _      | Comment selected lines

## Used plugins

| Plugin     | Plugin URL
| ---------- |:--------------------
| NerdTree   | https://github.com/davidhalter/jedi-vim
| MatchIt    | http://www.vim.org/scripts/script.php?script_id=39
| T-Comment  | https://github.com/vim-scripts/tComment
| Fugutive   | https://github.com/tpope/vim-fugitive
| Airline    | https://github.com/bling/vim-airline
| Syntastic  | https://github.com/scrooloose/syntastic
| Virtualenv | https://github.com/jmcantrell/vim-virtualenv
| CtrlP      | https://github.com/kien/ctrlp.vim
| Emmet      | https://github.com/mattn/emmet-vim
| Jedi       | https://github.com/davidhalter/jedi-vim
