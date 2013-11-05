set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'chriskempson/base16-vim'

Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'Yggdroot/indentLine'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'SirVer/ultisnips'
Bundle 'mattn/emmet-vim'
Bundle 'ervandew/supertab'
Bundle 'Valloric/MatchTagAlways'
Bundle 'airblade/vim-gitgutter'

filetype plugin indent on
if &t_Co > 2 || has("gui_running")
    syntax on           " syntax-highlighting
    colors base16-default " Color scheme
    set guioptions=g " Disable all GUI elements
    set guioptions+=c " Enable Console-based dialogs for simple queries
    " set guioptions+=e " Enable GUI tabs
    set background=dark " Dark backgroud
    set hlsearch        " Highlight search terms (very useful!)
    set incsearch       " Show search matches while typing
    hi clear VertSplit " Clear vertical split background
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

set fillchars=stl:\ ,stlnc:\ ,vert:│

if has("linebreak")
      let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
endif

set confirm " get a dialog when :q, :w, or :wq fails

let mapleader = "," " map leader

let maplocalleader = "_" " local leader

set lazyredraw " Don't redraw while executing macros (good performance config)

set laststatus=2 " enable statusline

" make a ruler at line 80
if exists('+colorcolumn')
    execute "set colorcolumn=" . join(range(81,335), ',')
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

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

" NERDTree configuration
let NERDTreeWinSize = 30
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=0
let NERDTreeChDirMode=2
let NERDTreeHijackNetrw=0
let NERDTreeIgnore = ['\.png$','\.pyc$', '\.db$', '\.git$', '*.\.o$',
                     \'.*\.out$', '.*\.so$', '.*\.a$', '.*\~$', '\.jpg$',
                     \'\.jpeg$', '\.gif$']

" Enable Jedi autocomplete
let g:jedi#auto_initialization = 1

let g:jedi#show_call_signatures = 0 " Disable or enable call signature

" Disable autocomplete when i type dot
let g:jedi#popup_on_dot = 0

" Enable jedi completion for omnifunc
autocmd FileType python set omnifunc=jedi#completions

" Disable jedi-vim documentation
autocmd FileType python setlocal completeopt-=preview

" Syntax check mode for python
let g:syntastic_python_checkers = ['pylama']

" Syntax check mode for javascript
let g:syntastic_javascript_checkers = ['jslint']

let g:syntastic_quiet_warnings = 0

let g:syntastic_enable_signs=0

" CtrlP Configuration
let g:ctrlp_match_window = 'bottom,order:top,min:1,max:20'
map <leader>b :CtrlPBuffer<CR>
map <leader>f :CtrlP<CR>
map <leader>t :CtrlPBufTag<CR>

" Comment selected line
map <leader>/ :TComment<CR>

let g:tcommentMapLeader2 = '<leader>/'

" Show/hide trail characters
nmap <leader>l :set list!<CR>

" leader-c check syntax
map <leader>c :SyntasticToggleMode<CR>

" Close buffer with ask save it
nmap <leader>w :confirm :bd<CR>

let g:indentLine_char = '│' " Indent guide symbol

let g:indentLine_color_gui = '#1D1D1D' " Indent guide symbol color

let g:airline_powerline_fonts = 1 " Use airline fonts

" If you want to auto-completion to work stable in older vim, disable this option
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#fnamemod = ':t'

let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1

function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction

map <leader>ee :call ToggleErrors()<CR>

let g:UltiSnipsJumpForwardTrigger='<tab>'

let g:mta_use_matchparen_group = 1

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'htmldjango' : 1,
    \}

let g:SuperTabDefaultCompletionType = "context"

" When i press <tab> by default enabled omni completion
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestEnhanced = 1
