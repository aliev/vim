## Description

## Minimal VIM configuration file based on KISS principle

![vim screen](https://raw.github.com/aliev/vim/master/screen.png "Vim screen")

## How to install?

```
cd ~
git clone https://github.com/aliev/vim.git
mv ~/vim ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "source ~/.vim/vimrc" > .vimrc
vim +BundleInstall +qall # Install all plugins

# Syntax check for python users
sudo pip install pylama

# Syntax check for javascript users
sudo npm install -g jslint
```

## For Mac users

You must install newtest macvim using brew (please, install XCode first):

```
brew install macvim --override-system-vim
```

This command will replace old system vim

## Important

If jedi-vim autocomplete doesn't work correctly, you must upgrade you vim to latest version (currently 7.4), or disable ```g:airline#extensions#tabline#enabled``` option

## More goodies for console users

### My tmux conf

if you use tmux, possible for you will use my configuration from git repo

or you can generate your own theme by using this vim plugin https://github.com/edkolev/tmuxline.vim

It seems all is well until it comes to using iTerm2 on OSX. Suddenly scrolling
back in the outer terminal shows history from prior to the start of tmux. There
are no end of suggestions about how to fix this, including "disable the status bar"
and "it should just work". Actually it’s fairly simple.

Enable the option under "Preferences -> Profiles -> Terminal" called
``` Save lines to scrollback when an app status bar is present ```

taken from here http://dan.carley.co/blog/2013/01/11/tmux-scrollback-with-iterm2/

Enable clipboard between the Mac OS and tmux: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

### FZF Note

To work correctly BTags and Ag commands you must install exuberant ctags, silver searcher, and fzf:

For MacOS X Users:

```
brew install ctags
brew install ag
```

For Ubuntu Users:

```
sudo apt-get install exuberant-ctags
apt-get install silversearcher-ag
```

FZF installation instructions you can find ![here](https://github.com/junegunn/fzf)

My ~/.agignore file

```
*.pdf
*.pyc
*.png
```

Ag much more quickly than find (default in fzf). you can replace find to ag for fzf as follows:

```
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'
```

### Oh-my-zsh

Note: If tmux will not recognize the fonts, uncomment the following line to the file. zshrc

```
# You may need to manually set your language environment
export LANG=en_EN.UTF-8
```

To console has become even more beautiful, you can use the following extensions

Zsh history substring search
https://github.com/zsh-users/zsh-history-substring-search

Zsh asutosuggestions
https://github.com/tarruda/zsh-autosuggestions

Zsh syntax highlighting
https://github.com/zsh-users/zsh-syntax-highlighting

An example of how I connected the extensions

```
# Must be enabled before zsh-autosuggestions!
source ~/zsh-history-substring-search/zsh-history-substring-search.zsh

(If you're use oh-my-zsh just add "zsh-history-substring-search" into plugins variable)

# Setup zsh-autosuggestions
source ~/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### Patched Menlo fonts for powerline you can get here

https://github.com/abertsch/Menlo-for-Powerline

or you can install ready fonts from the root of my repository
