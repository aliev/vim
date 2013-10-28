set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'sjl/badwolf'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'kien/ctrlp.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'mattn/emmet-vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'SirVer/ultisnips'
Bundle 'Yggdroot/indentLine'

filetype plugin indent on
syntax enable " enable syntax highlighting
if has('gui_running')
    set guioptions=g " Disable all GUI elements
    set background=dark " Dark backgroud
    execute "set colorcolumn=" . join(range(81,335), ',')
    colors jellybeans " Color scheme
    if has('mac')
        set guifont=Menlo\ Regular\ for\ Powerline:h12
        set guioptions+=c
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
else
    set t_Co=256
endif

if has('multi_byte')
    set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
endif

set fillchars=stl:\ ,stlnc:\ ,vert:│

if has("linebreak")
      let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
endif

let mapleader = "," " map leader

let maplocalleader = "_" " local leader

set lazyredraw " Don't redraw while executing macros (good performance config)

set laststatus=2 " enable statusline

set incsearch " Search by typing

set hlsearch " highlight search result

set magic " For regular expressions turn magic on

set ignorecase " Searches are Non Case-sensitive

set cursorline " Highlight current cursor position

set smartcase

set showmatch " Show matching brackets when text indicator is over them

set showcmd " Show incomplete cmds down the bottom

set showmode " Show current mode down the bottom

set title " show title

set acd " Vim will change the current working directory whenever you open a file

set expandtab " use space instead of tab

set autoread " Reload files changed outside automatically

set tabstop=4 " 1 tab == 4 spaces

set shiftwidth=4

set smarttab " Be smart when using tabs

set autoindent " Enable auto indent

set smartindent " Smart indent

set wrap " enable word wrap

set noerrorbells visualbell t_vb= " No annoying sound on errors

set encoding=utf8 " Default encoding

set termencoding=utf-8 " terminal encoding

set fileencodings=utf8,cp1251

set number " enable line numbers

set ruler " always display cursor position

if has('mouse')
    set mouse=a " Mouse support
    set mousemodel=popup
    set mousehide " Hide cursor when typing
endif

set hidden " A buffer becomes hidden when it is abandoned

set nobackup " Disable backup files

set noswapfile " Disable swap files

set noautochdir " change the current working directory whenever you open a file

set wildmenu " Turn on the WiLd menu

set wildmode=list:longest,list:full

set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git " Ignore compiled files

set clipboard+=unnamed " Global clipboard between the system and the editor

set ttyfast

set path=.,,**

" set nofoldenable " don't fold by default

" set foldlevel=1 " folding level

" set foldnestmax=10 " deepest fold is 10 levels

" set foldmethod=indent " fold based on indent

" set foldcolumn=5 " foldcolumn width

" NERDTree configuration
let NERDTreeWinSize = 30
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2
let NERDTreeHijackNetrw=0
let NERDTreeIgnore = ['\.png$','\.pyc$', '\.db$', '\.git$', '*.\.o$', '.*\.out$', '.*\.so$', '.*\.a$', '.*\~$']
map <leader>e :NERDTreeToggle<CR>

" Enable Jedi autocomplete
let g:jedi#auto_initialization = 1

" leader + c jedi completion
let g:jedi#completions_command="<leader>c"

" Disable jedi-vim documentation
autocmd FileType python setlocal completeopt-=preview

" Syntax check mode for python
let g:syntastic_python_checkers=['pylint', 'python']

" Syntax check mode for javascript
let g:syntastic_javascript_checkers = ['jslint']

" Warning and Error symbols
let g:syntastic_error_symbol = nr2char(33)
let g:syntastic_style_error_symbol = nr2char(33)
let g:syntastic_warning_symbol = nr2char(9888)
let g:syntastic_style_warning_symbol = nr2char(9888)

let g:airline#extensions#tabline#enabled = 1 " Enable airline tabs

let g:airline#extensions#tabline#fnamemod = ':t' " :help filename-modifiers

let g:airline_powerline_fonts = 1 " Use airline fonts

" CtrlP Configuration
let g:ctrlp_match_window = 'bottom,order:top,min:1,max:20'

" Open buffers
map <leader>b :CtrlPBuffer<CR>

" Open files
map <leader>f :CtrlP<CR>

map <leader>c :TComment<CR>

" Show/hide trail characters
nmap <leader>l :set list!<CR>

" Close buffer with ask save it
nmap <leader>w :confirm :bd<CR>

command! W exec 'w !sudo tee % > /dev/null' | e! " Save file with root permissions

let g:indentLine_char = '│'
