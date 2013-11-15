set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'chriskempson/base16-vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'davidhalter/jedi-vim'
Bundle 'bling/vim-airline'
Bundle 'SirVer/ultisnips'
Bundle 'mattn/emmet-vim'
Bundle 'mhinz/vim-signify'
Bundle 'Blackrush/vim-gocode'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-bufferline'
Bundle 'kien/ctrlp.vim'
" Bundle 'Yggdroot/indentLine'

filetype plugin indent on     " required!

if &t_Co > 2 || has("gui_running")
    syntax on           " syntax-highlighting
    set t_Co=256
    colors base16-default " Color scheme
    set guioptions=g " Disable all GUI elements
    set guioptions+=c " Enable Console-based dialogs for simple queries
    " set guioptions+=e " Enable GUI tabs
    set background=dark " Dark backgroud
    set hlsearch        " Highlight search terms (very useful!)
    set incsearch       " Show search matches while typing
    if has('mac')
        set guifont=Menlo\ Regular\ for\ Powerline:h12
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
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

" set cursorline " Highlight current cursor position

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

let g:jedi#auto_initialization = 1 " Enable Jedi autocomplete
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

    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
    autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=8
endif

" Syntax check mode for python (pip install pylama)
let g:syntastic_python_checkers = ['pylama']

" Syntax check mode for javascript (npm install jslint)
let g:syntastic_javascript_checkers = ['jslint']

" Syntastic disable signs
let g:syntastic_enable_signs=0


" Comment selected line
map <leader>/ :TComment<CR>

" File autocomplte
imap <leader>f <c-x><c-f>

" Default autocomplete
imap <leader>c <c-x><c-o>

" T-Comment keymap
let g:tcommentMapLeader2 = '<leader>/'

" Show/hide trail characters
nmap <leader>l :set list!<CR>

" Close buffer with ask save it
nmap <leader>w :confirm :Bclose<CR>

map <leader>e :NERDTreeToggle<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>f :CtrlP<CR>

let g:indentLine_char = '│' " Indent guide symbol

let g:indentLine_color_gui = '#1D1D1D' " Indent guide color

let g:airline_powerline_fonts = 1 " Use airline fonts

" If you want to auto-completion to work stable in older vim, disable this option
let g:airline#extensions#tabline#enabled = 1

" Airline tabs settings
let g:airline#extensions#tabline#fnamemod = ':t'

let g:UltiSnipsJumpForwardTrigger='<tab>'

let g:NERDTreeMinimalUI=1


" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    "return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute ':confirm :bdelete '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
