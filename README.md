## Description

Minimal VIM configuration file based on KISS principle

## How to install?

```
git clone https://github.com/aliev/.vim.git
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "source ~/.vim/vimrc" > .vimrc
vim +BundleInstall +qall # Install all plugins
# for command-t plugin
cd .vim/bundle/command-t
rake make
```

## Key bindings

| Key        | Description
| ---------- |:---------------------------------------------------------------
| ,          | Default leader key
| :W         | Save file as superuser
| leader + n | Open (close) NERDTree
| leader + l | Enable (disable) displaying whitespace
| leader + f | Open Command-T files
| leader + b | Open Command-T buffers
| leader + e | Zen coding
| Leader + b | Set (unset) breakpoint
| K          | Show python docs
| C + space  | Rope autocomplete
| C + c + g  | Rope goto definition
| C + c + d  | Rope show documentation
| C + c + f  | Rope find occurrences
| C + _      | Comment selected lines
| [[         | Jump on previous class or function (normal, visual, operator modes)
| ]]         | Jump on next class or function (normal, visual, operator modes)
| [M         | Jump on previous class or method (normal, visual, operator modes)
| ]M         | Jump on next class or method (normal, visual, operator modes)
