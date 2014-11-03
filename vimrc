set nocompatible              " be iMproved
filetype off                  " required!


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

" Utils
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'aliev/nerdtree'
Plugin 'kshenoy/vim-signature'
" Close buffer without close last window
Plugin 'aliev/bclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Git
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'

" Language specific
Plugin 'mattn/emmet-vim'
Plugin 'davidhalter/jedi-vim'

" Color scheme
Plugin 'jonathanfilip/vim-lucius'

filetype plugin indent on     " required!

if has("gui_running")
    syntax on           " syntax-highlighting
    set background=dark " Backgroud
    colors lucius       " Color scheme
    set guioptions=g    " Disable all GUI elements
    set guioptions+=c   " Enable Console-based dialogs for simple queries
    set hlsearch        " Highlight search terms (very useful!)
    set incsearch       " Show search matches while typing

    set guifont=Menlo\ Regular\ for\ Powerline:h12
else
    syntax on
    " set t_Co=256
    set background=dark
    colors lucius

    hi clear SpellBad
    hi SpellBad cterm=underline,bold ctermfg=red
    hi SpellCap cterm=underline,bold ctermfg=red

    if $TMUX == ''
        " Set the cursor to a vertical line in insert mode and a
        " solid block in command mode
        let &t_SI = "\<Esc>P\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>P\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        " enable resize vim splits inside tmux
        set ttymouse=xterm2
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    endif

    " Timeout for esc
    set timeout timeoutlen=1000 ttimeoutlen=10
endif

" Ebable colorcolumn
execute "set colorcolumn=" . join(range(81,335), ',')

if has('multi_byte')
    set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
endif

" Vertical split chars
set fillchars=stl:\ ,stlnc:\ ,vert:│

if has("linebreak")
      let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
endif

" Cursor position free mode
"set ve=all nosol

set foldmethod=manual " Folding method

set foldcolumn=1 " Folding column size

set confirm " Get a dialog when :q, :w, or :wq fails

let mapleader = "," " Map leader

let maplocalleader = "_" " Local leader

set lazyredraw " Don't redraw while executing macros (good performance config)

set laststatus=2 " Enable statusline

set magic " For regular expressions turn magic on

set ignorecase " Searches are Non Case-sensitive

" set cursorline " Highlight current cursor position

set smartcase " Do smart case matching when searching

set showmatch " Show matching brackets when text indicator is over them

set showcmd " Show incomplete cmds down the bottom

set showmode " Show current mode down the bottom

set title " Show title

set acd " Vim will change the current working directory whenever you open a file

set expandtab " Use space instead of tab

set autoread " Reload files changed outside automatically

set tabstop=4 " 1 tab == 4 spaces

set shiftwidth=4

set smarttab " Be smart when using tabs

set autoindent " Enable auto indent

set smartindent " Smart indent

" set wrap " Enable word wrap

set nowrap " Disable word wrap

set noerrorbells visualbell t_vb= " No annoying sound on errors

set encoding=utf8 " Default encoding

set termencoding=utf-8 " Terminal encoding

set fileencodings=utf8,cp1251 " Supported file encodings

set number " Enable line numbers

set ruler " Always display cursor position

if has('mouse')
    set mouse=a " Mouse support
    set mousemodel=popup
    set mousehide " Hide cursor when typing
endif

set hidden " A buffer becomes hidden when it is abandoned

set noswapfile " Disable swap files

set undofile " Enable undofile

set undodir=~/.vim/tmp/undo " Undo files directory

set noautochdir " Change the current working directory whenever you open a file

set wildmenu " Turn on the Wild menu

set wildmode=list:longest,list:full " Wildmenu configuration

set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git " Ignore compiled files

set conceallevel=2 " Conceal level

set ttyfast " Optimize for fast terminal connections

set path=.,,**

if has("autocmd")
    " Python: jedi-vim autocomplete options
    au FileType python set omnifunc=jedi#completions

    " Python: jedi-vim disable auto preview docs
    au FileType python setlocal completeopt-=preview

    " Python indentation
    au FileType python setlocal expandtab shiftwidth=4 tabstop=8

    " JavaScript indentation
    au FileType javascript setlocal expandtab shiftwidth=2 tabstop=8
endif

" ################### Keymaps and plugins configuration ########################

" Comment selected line
map <leader>/ :TComment<CR>

" File autocomplte
imap <leader>f <c-x><c-f>

" Default autocomplete
imap <leader>c <c-x><c-o>

" Show/hide trail characters
nmap <leader>l :set list!<CR>

nnoremap <leader>e :NERDTreeToggle<CR>

" Close buffer with ask save it
nnoremap <leader>w :confirm :Bclose<CR>

" T-Comment keymap
let g:tcommentMapLeader2 = '<leader>/'

let g:airline_powerline_fonts = 1 " Use airline fonts

" If you want to auto-completion to work stable in older vim, disable this option
let g:airline#extensions#tabline#enabled = 1

" Airline tabs settings
let g:airline#extensions#tabline#fnamemod = ':t'

let g:UltiSnipsJumpForwardTrigger='<tab>'

let g:jedi#show_call_signatures = 0 " Disable or enable function call signature
let g:jedi#popup_on_dot = 0 " Disable autocomplete when i type dot
let g:jedi#use_tabs_not_buffers = 0

let g:NERDTreeMinimalUI=1
let NERDTreeIgnore = ['\.pyc$']

nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>s :CtrlPBufTag<cr>

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

let g:ycm_key_list_select_completion = []

" Make indent line faster
let g:indentLine_faster=1

" IndentLine character
" For use this feature please install patched font from repository root
let g:indentLine_char=nr2char(0xE0A3)

" Signify characters
let g:signify_sign_add=nr2char(0xE0B9)
let g:signify_sign_delete=nr2char(0xE0BA)
let g:signify_sign_delete_first_line=nr2char(0xE0BB)
let g:signify_sign_change=nr2char(0xE0BD)

let g:airline_symbols={'linenr': '', 'paste': 'PASTE', 'readonly': '', 'modified': nr2char(0xE0B4), 'space': ' ', 'whitespace': '✹', 'branch': ''}


" Disable background and foreground for vertical split
hi vertsplit ctermbg=NONE guibg=NONE

" Signify colors
hi SignifySignAdd guibg=#4e4e4e ctermbg=239
hi SignifySignChange guibg=#4e4e4e ctermbg=239
hi SignifySignDelete guibg=#4e4e4e ctermbg=239
hi SignifySignChangeDelete guibg=#4e4e4e ctermbg=239
