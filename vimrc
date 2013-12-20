set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
" Work with code
Bundle 'SirVer/ultisnips'
Bundle 'mattn/emmet-vim'
" Git
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-fugitive'
" Golang
Bundle 'Blackrush/vim-gocode'
" Python
Bundle 'davidhalter/jedi-vim'
" JavaScript
Bundle 'marijnh/tern_for_vim'
" Utils
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'aliev/bclose'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
" Color schemes
Bundle 'flazz/vim-colorschemes'
filetype plugin indent on     " required!

if has("gui_running")
    syntax on           " syntax-highlighting
    colors codeschool " Color scheme
    hi Pmenu guibg=black
    hi SignColumn guibg=#252c31
    hi VertSplit guifg=#1c3657 guibg=NONE
    set guioptions=g " Disable all GUI elements
    set guioptions+=c " Enable Console-based dialogs for simple queries
    " set guioptions+=e " Enable GUI tabs
    set background=dark " Backgroud
    set hlsearch        " Highlight search terms (very useful!)
    set incsearch       " Show search matches while typing

    " Vim airline color scheme
    let g:airline_theme = 'solarized'

    " make a ruler at line 80
    if exists('+colorcolumn')
        execute "set colorcolumn=" . join(range(81,335), ',')
    else
        au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    endif

    if has('mac')
        set guifont=Menlo\ Regular\ for\ Powerline:h12
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
else
    syntax on
    set t_Co=256
    colors xoria256
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

set magic " For regular expressions turn magic on

set ignorecase " Searches are Non Case-sensitive

" set cursorline " Highlight current cursor position

" set cursorcolumn " Highlight cursor column

set smartcase " Do smart case matching when searching

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

set fileencodings=utf8,cp1251 " supported file encodings

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

set wildmenu " Turn on the Wild menu

set wildmode=list:longest,list:full " Wildmenu configuration

set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git " Ignore compiled files

set clipboard+=unnamed " Global clipboard between the system and the editor

set ttyfast " Optimize for fast terminal connections

set path=.,,**

let g:jedi#show_call_signatures = 0 " Disable or enable function call signature
let g:jedi#popup_on_dot = 0 " Disable autocomplete when i type dot
let g:jedi#use_tabs_not_buffers = 0

if has("autocmd")
    " Enable jedi completion for omnifunc
    autocmd FileType python set omnifunc=jedi#completions

    " Disable jedi-vim documentation
    autocmd FileType python setlocal completeopt-=preview

    " Enable autocompletion for Golang
    autocmd FileType go set omnifunc=gocomplete#Complete

    " Disable gocode documentation
    autocmd FileType go setlocal completeopt-=preview
    autocmd FileType javascript setlocal completeopt-=preview

    " Indentation
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
    autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=8

    " JavaScript goto definiction
    autocmd FileType javascript nnoremap <leader>g :TernDef<CR>

endif

" Syntax check mode for python (pip install pylama)
let g:syntastic_python_checkers = ['pylama']

" Syntax check mode for javascript (npm install jslint)
let g:syntastic_javascript_checkers = ['jslint']

" Make syntastic auto update the location list and make it also check
" when the file opens
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1

" Syntastic signs (disables by default)
let g:syntastic_enable_signs=0

" Syntastic (if g:syntastic_enable_signs option enabled)
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'

" Comment selected line
map <leader>/ :TComment<CR>

" File autocomplte
imap <leader>f <c-x><c-f>

" Default autocomplete
imap <leader>c <c-x><c-o>

" Show/hide trail characters
nmap <leader>l :set list!<CR>

" Close buffer with ask save it
nnoremap <leader>w :confirm :Bclose<CR>

map <leader>e :NERDTreeToggle<CR>

" T-Comment keymap
let g:tcommentMapLeader2 = '<leader>/'

let g:airline_powerline_fonts = 1 " Use airline fonts

" If you want to auto-completion to work stable in older vim, disable this option
let g:airline#extensions#tabline#enabled = 1

" Airline tabs settings
let g:airline#extensions#tabline#fnamemod = ':t'

let g:UltiSnipsJumpForwardTrigger='<tab>'

let g:NERDTreeMinimalUI=1
let NERDTreeIgnore = ['\.pyc$']

" Автоматический insert mode
let g:unite_enable_start_insert = 1

" Отображаем Unite в нижней части экрана
let g:unite_split_rule = "botright"

" Отключаем замену статус строки
let g:unite_force_overwrite_statusline = 0

" Размер окна Unite
let g:unite_winheight = 10

" Красивые стрелочки
let g:unite_candidate_icon="▷"

nnoremap <leader>f :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<cr>
