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
## Important

If jedi-vim autocomplete doesn't work correctly, you can upgrade you vim to latest version (currently 7.4), or disable ```g:airline#extensions#tabline#enabled``` option in your vimrc file 

## Key bindings

| Key        | Description
| ---------- |:---------------------------------------------------------------
| ,          | Default leader key
| leader + l | Enable (disable) displaying whitespace
| leader + f | Open CtrlP
| leader + b | Open CtrlPBuffer
| leader + t | Open CtrlPBufTag
| leader + c | Open jedi vim complete pop-up (insert mode), Syntastic (visual mode)
| leader + g | goto definition
| leader + r | rename
| leader + n | usage
| leader + d | goto assignments
| leader + t | create new tab
| leader + w | close buffer (tabe) with asking save
| leader + / | Comment selected line
