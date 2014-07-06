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
```

## For Mac users

You must install newtest macvim using brew (please, install XCode first):

```
brew install macvim --override-system-vim
```

This command will replace old system vim

## Screenshots

![vim indent guides](https://raw.github.com/aliev/vim/master/vim.png "Vim with indent guides and trailing characters")

## Important

If jedi-vim autocomplete doesn't work correctly, you must upgrade you vim to latest version (currently 7.4), or disable ```g:airline#extensions#tabline#enabled``` option

## Key bindings

| Key        | Description
| ---------- |:---------------------------------------------------------------
| ,          | default leader key
| tab key    | ultisnips plugin
| leader + b | open CtrlPBuffer
| leader + c | autocomplete
| leader + d | goto assignments
| leader + e | NERDTree Toggle
| leader + f | open CtrlP (Visual mode), Open file autocomplete (Insert mode)
| leader + g | goto definition
| leader + l | enable (disable) displaying whitespace
| leader + n | find usage
| leader + r | rename
| leader + t | create new tab
| leader + w | close buffer (tabe) with asking save
| leader + / | comment selected line (T-Comment plugin)

## More goodies for console users

### Powerline for tmux

https://github.com/erikw/tmux-powerline

### Patched Menlo fonts for powerline you can get here

https://github.com/abertsch/Menlo-for-Powerline

### Prezto (awesome zsh configuration)

https://github.com/sorin-ionescu/prezto

### Vim indent line (not included in this configuration file)

https://github.com/Yggdroot/indentLine

Note:

```
let g:indentLine_faster=1
```

speed up the editor

### Vim GoCode (like jedi-vim for golang)

https://github.com/Blackrush/vim-gocode

### Tern based JavaScript editing

https://github.com/marijnh/tern_for_vim

### Multilanguage syntax checking

https://github.com/scrooloose/syntastic
