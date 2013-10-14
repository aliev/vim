set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'sjl/badwolf'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/matchit.zip'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'airblade/vim-gitgutter'
Bundle 'mhinz/vim-signify'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'mattn/emmet-vim'
Bundle 'mhinz/vim-startify'
filetype plugin indent on     " required!

if has('gui_running')
    set guioptions=g " disable all GUI elements

    colors badwolf " default color scheme

    if has('mac')
        set guifont=Menlo\ Regular\ for\ Powerline:h12
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
else
    set t_Co=256
endif

if has('multi_byte')
    set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
endif

if has("linebreak")
      let &sbr = nr2char(8618).' '  " Символ который будет показан перед перенесенной строкой
endif

filetype plugin indent on " Выключаем загрузку filetype и indent плагинов

let mapleader = "," " map leader

let maplocalleader = "_" " local leader

set lazyredraw " don't update the display while executing macros

set laststatus=2 " enable statusline

syntax enable " enable syntax highlighting

set incsearch " Search by typing

set hlsearch " highlight search result

set magic " Set magic on, for regular expressions

set ignorecase " Searches are Non Case-sensitive

set cursorline " Highlight current cursor position

set smartcase

set showmatch " highlight parent brackets

set showcmd " Show incomplete cmds down the bottom

set showmode " Show current mode down the bottom

set title " show title

set acd " Vim will change the current working directory whenever you open a file

set expandtab " use space instead of tab

set autoread " Reload files changed outside automatically

set tabstop=4 " number of spaces per tab

set shiftwidth=4 " Bспользуется для регулирование ширины отступов в пробелах добавляемых командами >> и <<

set smarttab " Добавление отступа при нажатии tab в соответствии с настройками ширины отступа shiftwidth

set autoindent " Enable auto indent

set smartindent

set wrap

set noerrorbells visualbell t_vb= " Disable visual bell

set encoding=utf8 " Default encoding

set termencoding=utf-8 " terminal encoding

set fileencodings=utf8,cp1251

set mousehide " Hide cursor when typing

set number " enable line numbers

set ruler " always display cursor position

set mouse=a " Mouse support

set mousemodel=popup

set hidden

set nobackup " Disable backup files

set noswapfile " Disable swap files

set noautochdir " change the current working directory whenever you open a file

" customize the wildmenu
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git

set clipboard+=unnamed " Global clipboard between the system and the editor

set ttyfast

set path=.,,**

" NERDTree configuration
let NERDTreeWinSize = 30
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2
let NERDTreeHijackNetrw=0
let NERDTreeIgnore = ['\.png$','\.pyc$', '\.db$', '\.git$', '*.\.o$', '.*\.out$', '.*\.so$', '.*\.a$', '.*\~$'] " Список игнорируемых файлов в NERDTree


set fillchars=stl:\ ,stlnc:\ ,vert:│

let g:pymode_rope = 1 " Enable pymode rope
let g:pymode_doc = 0 " Enable pymode documentation plugin

let g:pymode_lint = 0 " Disable python-mode linting for enable syntastic

let g:pymode_virtualenv = 1 " Python-mode support virtualenv

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0 " Don't autofold code
let g:pymode_breakpoint = 0 " Disable breakpoint plugin


let g:jedi#auto_initialization = 1 " Enable Jedi autocomplete

autocmd FileType python setlocal completeopt-=preview " Disable docstring window in Jedi

" Make syntastic auto update the location list and make it also check
" when the file opens
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_python_checkers=['pylint']

let g:airline#extensions#tabline#enabled = 1 " Enable airline tabs
let g:airline#extensions#tabline#fnamemod = ':t' " :help filename-modifiers
let g:airline_powerline_fonts = 1 " Use airline fonts
let g:airline_theme='wombat'

" Key bindings
map <leader>b :CtrlPBuffer<CR>
map <leader>f :CtrlP<CR>
map <leader>e :NERDTreeToggle<CR>
nmap <leader>l :set list!<CR>
let g:jedi#completions_command="<leader>c" " leader + c jedi completion
