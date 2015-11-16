scriptencoding utf-8

""""""""""""""""""""""""""""""""""""""""""""""""
" This is the minimum vim configuration file
" which can be used separately from other files
""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set t_Co=256

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Vim cursor shape options
" 1 or 0 blinking block
" 2 solid block
" 3 blinking underscore
" 4 solid underscore
" 5 blinking line
" 6 solid line
if has("mac")
  let &t_SI.="\e[6 q" " Start insert mode
  let &t_EI.="\e[2 q" " End insert mode
endif

if has('mouse')
  set mouse=a " Enable mouse support
  set mousemodel=popup " Use the mouse for copy/paste with popup in gui vim
  set mousehide " Hide cursor while typing
  if exists("$TMUX")
    if !has('nvim')
      " Tmux knows the extended mouse mode
      set ttymouse=xterm2
    endif
  endif
endif

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'trail:·,tab:»·,eol:¶,extends:→,precedes:←,nbsp:×'
  let &fillchars = 'stl: ,stlnc: ,vert:│'

  if has('patch-7.4.338')
    let &showbreak = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
    set breakindent
    set breakindentopt=sbr
  endif
endif

if has('nvim')
  set rtp+=~/.vim/
  " If Neovim support is enabled, then let set the
  " NVIM_TUI_ENABLE_CURSOR_SHAPE for the user.
  if $NVIM_TUI_ENABLE_CURSOR_SHAPE == ""
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
  endif
  let g:python_host_prog = "/usr/local/bin/python"
endif

if has("autocmd")
  filetype plugin indent on

  if exists('$TMUX') && !exists('$NORENAME')
    " Automatic rename of tmux window
    " Set this option for ~/.tmux.conf: set-option -g allow-rename off 
    au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
  endif

  augroup reset-cursor
    " Reset cursor when vim exits
    " pls look at the cursor shape options
    au VimLeave * silent !echo -ne "\033]112\007"
  augroup END

  augroup vimrc-remember-cursor-position
    " Remember cursor position
    au!
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
          \| exe "normal! g`\"" | endif
  augroup END
endif

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  let $FZF_DEFAULT_COMMAND='ag -l -g ""'
endif

if exists("+undofile")
  " Store undofile in to fixed location
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  set undofile
  set undodir=/var/tmp//,/tmp//,.
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

if !&scrolloff
  set scrolloff=1
endif

if !&sidescrolloff
  set sidescrolloff=5
endif

if v:version > 703 || v:version == 703 && has("patch541")
  " Delete comment character when joining commented lines
  set formatoptions+=j
endif

if &history < 1000
  set history=1000
endif

let mapleader = "," " Map leader

let maplocalleader = "_" " Local leader

" Store swap files in to fixed location
set noswapfile
set directory=/var/tmp//,/tmp//,.

" Store backup files in to fixed location
set nobackup
set backupdir=/var/tmp//,/tmp//,.

" This will set your path variable to current directory
" (from which you launched vim) and to all directories
" under current directory recursively.
set path=.,,**

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
"set viminfo='10,\"100,:20,%,n~/.viminfo

set ttimeout ttimeoutlen=0 notimeout " Disable timeout for Esc key
set ttyfast " Optimize for fast terminal connections
set lazyredraw " Don't redraw while executing macros (good performance config)

set completeopt=menuone,longest " Completion do not select the first candidate

set complete-=i " Disable completion by included files

set confirm " Get a dialog when :q, :w, or :wq fails

set hlsearch " Highlight search terms (very useful!)

set incsearch " Show search matches while typing

set display+=lastline " Display lastline instead of @

set laststatus=2 " Enable statusline

set magic " For regular expressions turn magic on

set ignorecase " Searches are Non Case-sensitive

set smartcase " Do smart case matching when searching

set showcmd " Show incomplete cmds down the bottom

set title " Show title

set acd " Vim will change the current working directory whenever you open a file

set autoread " Reload files changed outside automatically

set tabstop=4 shiftwidth=4 expandtab " Use space instead of tab

set backspace=2 " Make backspace work like most other apps

set smarttab " Be smart when using tabs

set autoindent " Enable auto indent

set smartindent " Smart indent

set wrap tw=0 " Enable word wrap, disable line break

set noerrorbells visualbell t_vb= " No annoying sound on errors

set encoding=utf8 " Default encoding

set termencoding=utf-8 " Terminal encoding

set fileencodings=utf8,cp1251 " Supported file encodings

set number " Enable line numbers

set ruler " Always display cursor position

set hidden " A buffer becomes hidden when it is abandoned

set noautochdir " Change the current working directory whenever you open a file

set wildmenu " Turn on the Wild menu

set wildmode=list:longest,list:full " Wildmenu configuration

" ignore general temp files
set wildignore+=.DS_Store,.git/**,tmp/**,*.log,.bundle/**,node_modules/**,tags

" ignore compiled files
set wildignore+=*.rbc,.rbx,*.scssc,*.sassc,.sass-cache,*.pyc,*.gem

" ignore images
set wildignore+=*.jpg,*.jpeg,*.tiff,*.gif,*.png,*.svg,*.psd,*.pdf

set conceallevel=2 " Conceal level

set modelines=1 " Make Vim only use folding settings for current file

set noshowmode " Suppress mode change messages

set exrc " Allow load .vimrc or _vimrc from current directory

if filereadable(expand('~/.vim/plugins.vim'))
  " Include plugins list
  source ~/.vim/plugins.vim
endif

if filereadable(expand('~/.vimrc.local'))
  " Local vimrc
  source ~/.vimrc.local
endif

" vim:foldmethod=marker:foldlevel=0:tabstop=2:shiftwidth=2
