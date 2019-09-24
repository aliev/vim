" vimrc.vim - Defaults everyone can agree on
" Maintainer:   Ali Aliyev <https://github.com/aliev/>
" Version:      1.2

if exists('g:loaded_vimrc') || &compatible
  finish
else
  let g:loaded_vimrc = 'yes'
endif

if has('vim_starting')
  set nocompatible
endif

if has('gui_running')
  set guioptions=gc
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
  syntax sync minlines=256
endif

if has('mouse')
  set mouse=a " Enable mouse support
  set mousemodel=popup " Use the mouse for copy/paste with popup in gui vim
  set mousehide " Hide cursor while typing
  if exists("$TMUX")
    if has('nvim')
      set inccommand=split
    endif
    if !has('nvim')
      " Tmux knows the extended mouse mode
      set ttymouse=xterm2
    endif
  endif
endif

if has('multi_byte') && &encoding ==# 'utf-8'
  set list
  let &listchars = 'trail:·,tab:»·,extends:→,precedes:←,nbsp:×'
  let &fillchars = 'stl: ,stlnc: ,vert:│'

  if has('patch-7.4.338')
    let &showbreak = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
    set breakindent
    set breakindentopt=sbr
  endif
endif

if has("autocmd")
  filetype plugin indent on

  augroup vimrc
    au!

    " Remember cursor position
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
          \| exe "normal! g`\""
          \| endif

    if exists('$TMUX')
      if !exists('$NORENAME') && !has('gui')
        " Automatic rename of tmux window
        " Set option set-option -g allow-rename off in ~/.tmux.conf
        au BufEnter * if empty(&buftype)
              \| call system('tmux rename-window '.expand('%:t:S'))
              \| endif
        au VimLeave * call system('tmux set-window automatic-rename on')
      endif
    endif
  augroup END
endif

if isdirectory('.git') && executable('git')
  set grepprg=git\ grep\ -nI
endif

if executable('ag') && !isdirectory('.git')
  " Silver searcher instead of grep
  set grepprg=ag\ --vimgrep
  set grepformat=%f:%l:%c%m
endif

if &shell =~# 'fish$'
  " Avoid problems with fish shell.
  " https://github.com/tpope/vim-sensible/issues/50
  set shell=/bin/bash
endif

if !&scrolloff
  set scrolloff=1
endif

if !&sidescrolloff
  set sidescrolloff=5
endif

" Delete comment character when joining commented lines
set formatoptions+=j

if &history < 1000
  set history=1000
endif

" Store swap files in to fixed location
set noswapfile
set directory=/var/tmp//,/tmp//,.

" Store backup files in to fixed location
set backup
set backupcopy=yes
set backupdir=/var/tmp//,/tmp//,.

" Store undofile in to fixed location
set undofile
set undodir=/var/tmp//,/tmp//,.

" This will set your path variable to current directory
" (from which you launched vim) and to all directories
" under current directory recursively.
set path=.,,**

" Performance fixes
set regexpengine=1
set ttimeout ttimeoutlen=0 notimeout " Disable timeout for Esc key
set ttyfast " Optimize for fast terminal connections
set lazyredraw
set noshowcmd
set foldmethod=marker
set synmaxcol=128

set completeopt=menuone,noselect " Completion do not select the first candidate

set complete-=i " Disable completion by included files

set confirm " Get a dialog when :q, :w, or :wq fails

set hlsearch " Highlight search terms (very useful!)

set incsearch " Show search matches while typing

set display+=lastline " Display lastline instead of @

set laststatus=2 " Show statusline

set showtabline=2 " Always show tabline

set magic " For regular expressions turn magic on

set ignorecase " Searches are Non Case-sensitive

set smartcase " Do smart case matching when searching

set title " Show title

set diffopt+=vertical " Vertical diff

set acd " Vim will change the current working directory whenever you open a file

set tabstop=4 " Number of spaces that a <Tab> in the file counts for

set softtabstop=0 " Number of spaces that a <Tab> counts for while performing editing operations

set shiftwidth=4 " Number of spaces to use for each step of (auto)indent

set expandtab " Use the appropriate number of spaces to insert a <Tab>

set backspace=indent,eol,start " Fix backspace indent

set smarttab " Be smart when using tabs

set autoindent " Enable auto indent

set nosmartindent " Disable smart indent

set wrap tw=0 " Enable word wrap, disable line break

set noerrorbells visualbell t_vb= " No annoying sound on errors

set encoding=utf8 " Default encoding

set termencoding=utf-8 " Terminal encoding

set fileencodings=utf8 " Supported file encodings

set number " Enable line numbers

set ruler " Always display cursor position

set hidden " Enable hidden buffers

set autowrite " Automatically save before commands like :next and :make

set autoread " Reload files changed outside automatically

set noautochdir " Change the current working directory whenever you open a file

set wildmenu " Turn on the Wild menu

set wildmode=list:longest,list:full

set wildcharm=<Tab>

" Ignore files
set wildignore+=.DS_Store,.git/**,__pycache__,tmp/**,*.log,.bundle/**,node_modules/**,env/**
set wildignore+=*.rbc,.rbx,*.scssc,*.sassc,.sass-cache,*.pyc,*.gem
set wildignore+=*.jpg,*.jpeg,*.tiff,*.gif,*.png,*.svg,*.psd,*.pdf

set modelines=1 " Make Vim only use folding settings for current file

set noshowmode " Suppress mode change messages

set secure exrc " Allow load .vimrc or _vimrc from current directory

set shortmess+=I " Don't display the intro message on starting Vim.

" absolute width of netrw window
let g:netrw_winsize = -28

" do not display info on the top of window
let g:netrw_banner = 0

" tree-view
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" use the same window to open file
let g:netrw_browse_split = 0
"
" Visually select the text that was last edited/pasted
noremap gV `[v`]
"
" Let's remove this annoying :W and :Q
cnoremap W w
cnoremap Q q
"
" Keep selection after in/outdent
vnoremap < <gv
vnoremap > >gv
