scriptencoding utf-8

syntax on " enable syntax-highlighting

if has("gui_running")
    set guioptions=gc   " Disable all GUI elements and enable console based dialogs for simple queries
    set guifont=Droid_Sans_Mono_For_Powerline_Plus_Nerd_File_Types:h13
else
    set t_Co=256
    " Allows cursor change in tmux mode
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
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
    set listchars=tab:\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
    " Vertical split chars
    set fillchars=stl:\ ,stlnc:\ ,vert:│
    if has("linebreak")
          let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
    endif
endif

if has("autocmd")
    " Enable file type detection.
    filetype plugin indent on

    " Auto complete options for Python (we use jedi by default)
    au FileType python set omnifunc=jedi#completions

    " Auto complete options for JavaScript
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

    " Python: jedi-vim disable auto preview docs
    au FileType python setlocal completeopt-=preview

    " Python indentation
    " About nosmartindent please look this link
    " http://stackoverflow.com/questions/2063175/vim-insert-mode-comments-go-to-start-of-line
    au FileType python setlocal expandtab shiftwidth=4 tabstop=8 nosmartindent nofoldenable

    " Django autocomplete options
    au FileType html set filetype=htmldjango
    au FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango

    " Folding by marker for vim files
    au FileType vim setlocal foldmethod=marker foldlevel=0

    " JavaScript indentation
    au FileType javascript setlocal expandtab shiftwidth=2 tabstop=8
endif

set background=dark " Backgroud

" Disable timeout for Esc key
set ttimeout
set ttimeoutlen=0
set notimeout

" Autocomplete options:
" longest: do not select the first candidate
" set completeopt=menuone,longest
set completeopt=menuone,longest,preview

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

"set showmatch " Show matching brackets when text indicator is over them

set showcmd " Show incomplete cmds down the bottom

set noshowmode " Do not show current mode down the bottom (we use vim-airline)

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

set noswapfile " Disable swap files

set undofile " Persistent undo

set noautochdir " Change the current working directory whenever you open a file

set wildmenu " Turn on the Wild menu

set wildmode=list:longest,list:full " Wildmenu configuration

set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git " Ignore compiled files

set conceallevel=2 " Conceal level

set ttyfast " Optimize for fast terminal connections

set foldmethod=indent " Folding method by default

set foldlevel=3 " Folding level

" Python path for neovim
let g:python_host_prog='/usr/bin/python'

set path=.,,**

" Store swap, backup and undo files in fixed location
set dir=/var/tmp//,/tmp//,.
set backupdir=/var/tmp//,/tmp//,.
set undodir=/var/tmp//,/tmp//,.

if filereadable(expand('~/.vim/plugins.vim'))
    " Load plugins
    source ~/.vim/plugins.vim
endif

if filereadable(expand('~/.vim/options.vim'))
    " Load Another stuff (plugins configurations, keymaps and colors)
    source ~/.vim/options.vim
endif

if filereadable(expand('~/.vim/keys.vim'))
    " Load keymaps
    source ~/.vim/keys.vim
endif

if filereadable(expand('~/.vim/fzf.vim'))
    " Load fzf options
    source ~/.vim/fzf.vim
endif

" If neovim invlude neovim configurations
if has("nvim")
    " Load NeoVim configurations
    if filereadable('~/.vim/nvim.vim')
        source ~/.vim/nvim.vim
    endif
endif
