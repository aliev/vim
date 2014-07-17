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

if you use tmux, possible for you will use the following configuration

```
# don't wait for an escape sequence after hitting
# Esc. fixes insert mode exit lag in vim
set -sg escape-time 0
set -g terminal-overrides 'xterm*:smcup@:rmcup@'
```

It seems all is well until it comes to using iTerm2 on OSX. Suddenly scrolling
back in the outer terminal shows history from prior to the start of tmux. There
are no end of suggestions about how to fix this, including "disable the status bar"
and "it should just work". Actually it’s fairly simple.

Enable the option under "Preferences -> Profiles -> Terminal" called
``` Save lines to scrollback when an app status bar is present ```

taken from here http://dan.carley.co/blog/2013/01/11/tmux-scrollback-with-iterm2/


For enable support clipboard between the Mac OS and tmux

https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

### CtrlP Note

To work correctly CtrlPBufTag you must install exuberant ctags.

For MacOS X Users:

```
brew install ctags
```

For Ubuntu Users:

```
sudo apt-get install exuberant-ctags
```

### Patched Menlo fonts for powerline you can get here

https://github.com/abertsch/Menlo-for-Powerline

### Prezto (awesome zsh configuration)

https://github.com/sorin-ionescu/prezto

### Vim indent line

https://github.com/Yggdroot/indentLine

Note, option:

```
let g:indentLine_faster=1
```

will speed up the indentLine

### Vim GoCode (like jedi-vim for golang)

https://github.com/Blackrush/vim-gocode

### Tern based JavaScript editing

https://github.com/marijnh/tern_for_vim

### Multilanguage syntax checking

https://github.com/scrooloose/syntastic

## Screenshots

![vim indent guides](https://raw.github.com/aliev/vim/master/vim.png "Vim with indent guides and trailing characters")
