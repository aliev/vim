scriptencoding utf-8

syntax on " enable syntax-highlighting

set background=dark " Backgroud color

" GUI and Terminal VIM options {{{
if has("gui_running")
    set guioptions=gc   " Disable all GUI elements and enable console based dialogs for simple queries
    set guifont=DroidSansMonoForPowerlinePlusNerdFileTypesPlusPomicons:h13
else
    set t_Co=256
endif
" }}}

" Neovim settings
if has("nvim")
    " Esc for exit from terminal
    tnoremap <Esc> <C-\><C-n>

    " Python path
    let g:python_host_prog='/usr/local/bin/python'
endif

if has('mouse')
    set mouse=a " Enable mouse support
    set mousemodel=popup " Use the mouse for copy/paste with popup in gui vim
    set mousehide " Hide cursor while typing
    if exists("$TMUX")
        " tmux knows the extended mouse mode
        if has('nvim')
        else
            set ttymouse=xterm2
        endif
    endif
endif

if has('multi_byte')
    set listchars=trail:·,tab:»·,eol:¶,extends:→,precedes:←,nbsp:×
    " Vertical split chars
    set fillchars=stl:\ ,stlnc:\ ,vert:│
    if has("linebreak")
          let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
    endif
endif

if has("autocmd")
    " Enable file type detection.
    filetype plugin indent on

    " Python indentation
    " About nosmartindent please look this link
    " http://stackoverflow.com/questions/2063175/vim-insert-mode-comments-go-to-start-of-line
    au FileType python setlocal expandtab shiftwidth=4 tabstop=8 nosmartindent nofoldenable

    " JavaScript indentation
    au FileType javascript setlocal expandtab shiftwidth=2 tabstop=8

    " Remember cursor position
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Disable timeout for Esc key
set ttimeout
set ttimeoutlen=0
set notimeout
set ttyfast " Optimize for fast terminal connections

" Autocomplete options:
" longest: do not select the first candidate
" preview: removed includes display of documentation
set completeopt=menuone,longest

set confirm " Get a dialog when :q, :w, or :wq fails

let mapleader = "," " Map leader

let maplocalleader = "_" " Local leader

set hlsearch " Highlight search terms (very useful!)

set display+=lastline " Display lastline instead of @

set incsearch " Show search matches while typing

set lazyredraw " Don't redraw while executing macros (good performance config)

set laststatus=2 " Enable statusline

set magic " For regular expressions turn magic on

set ignorecase " Searches are Non Case-sensitive

set smartcase " Do smart case matching when searching

set showcmd " Show incomplete cmds down the bottom

set title " Show title

set acd " Vim will change the current working directory whenever you open a file

set expandtab " Use space instead of tab

set autoread " Reload files changed outside automatically

set tabstop=4 " 1 tab == 4 spaces

set shiftwidth=4

set backspace=2

set smarttab " Be smart when using tabs

set autoindent " Enable auto indent

set smartindent " Smart indent

set wrap " Enable word wrap

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

set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git " Ignore compiled files

set conceallevel=2 " Conceal level

set modelines=1 " Make Vim only use folding settings for current file

" FZF path
set rtp+=~/.vim/bundle/fzf

" This will set your path variable to current directory
" (from which you launched vim) and to all directories
" under current directory recursively.
set path=.,,**

if exists("+undofile")
    " undofile - This allows you to use undos after exiting and restarting
    " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    " :help undo-persistence
    " This is only present in 7.3+
    set undofile

    " Store undo files in to fixed location
    set undodir=/var/tmp//,/tmp//,.
endif

" Store swap and backup files in to fixed location
set noswapfile
set directory=/var/tmp//,/tmp//,.

set nobackup
set backupdir=/var/tmp//,/tmp//,.

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
endif

if filereadable(expand('~/.vim/plugins.vim'))
    " Load plugins
    source ~/.vim/plugins.vim
endif

if filereadable(expand('~/.vim/stuff.vim'))
    " Load Another stuff (plugins configurations, keymaps and colors)
    source ~/.vim/stuff.vim
endif

set noshowmode " Suppress mode change messages

" vim:foldmethod=marker:foldlevel=0
