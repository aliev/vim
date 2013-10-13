set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'sjl/badwolf'

" Utilities
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/matchit.zip'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/MatchTag'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'airblade/vim-gitgutter'
Bundle 'mhinz/vim-signify'
Bundle 'kien/ctrlp.vim'

" For python supporting
Bundle 'klen/python-mode'
Bundle 'tshirtman/vim-cython'
Bundle 'davidhalter/jedi-vim'

" Web development
Bundle 'mattn/emmet-vim'
Bundle 'vim-scripts/vim-coffee-script'
Bundle 'groenewege/vim-less'

filetype plugin indent on     " required!

if has('gui_running') " Глобальные настройки на GUI Vim
    set guioptions-=m " убираем меню
    " set guioptions-=e " убираем вкладки GUI делаем их как в консоли
    set guioptions-=T " убираем тулбар
    set guioptions-=r " убираем полосы прокрутки справа
    set guioptions-=L " убираем полосы прокрутки слева
    set background=light " Цвет фона темный или светлый
    set guioptions-=R
    set guioptions-=l
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif

if has('gui_macvim') " Для GUI Macvim
    " set guifont=Monaco:h12 " Шрифт по умолчанию
    set guifont=Menlo\ Regular\ for\ Powerline:h12 " Шрифт по умолчанию
    set fuoptions=maxvert,maxhorz
    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
    set background=dark
    colors badwolf
elseif has('gui_gtk') || has('gui_gtk2') " Для GUI Linux
    set guifont="Ubuntu Mono":h15 " Шрифт по умолчанию
elseif has('gui_win32') " Для GUI Windows
else " Для консолбного вима
    set t_Co=256 " 256 цветов для консоли
endif

if v:version >= 7 " Если у нас версия VIM 7.3
    " set undofile " Включаем вечный undo
    " set undodir=/tmp/undo/ " Куда записывать файлы для undo

    " set relativenumber " Нумерование строк не относительно начала файла, а относительно текущего положения курсора

    set cursorline " Подсветка текущей позиции курсора по горизонтали

    " set cursorcolumn " Подсветка текущей позиции курсора по вертикали

    " set colorcolumn=80 " Отображает правую границу
end

if has("autocmd")
    au FileType ruby set shiftwidth=2
    au FileType javascript set shiftwidth=2
    au FileType php set shiftwidth=4
    au FileType python set shiftwidth=4
endif

" set list " Включить неотображаемые символы
if has('multi_byte')
    if version >= 700
        set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
        " set listchars=tab:▸\ ,eol:¬ " TextMake theme
    else
        set listchars=tab:»\ ,trail:·,eol:¶,extends:>,precedes:<,nbsp:_
    endif
endif


if has("linebreak")
      let &sbr = nr2char(8618).' '  " Символ который будет показан перед перенесенной строкой
endif

filetype plugin indent on " Выключаем загрузку filetype и indent плагинов

let mapleader = "," " основная клавиатурная комбинация
let g:maplocalleader = '_'

" set ttimeoutlen=-1  " Ускоряем работу Esc

" set showtabline=2 " Показывать табы всегда

" set foldenable " Включаем фолдинг
" 
" set foldcolumn=2 " Ширина колонки для фолдинга
" 
" set foldmethod=marker " Метод фолдинга
" 
" set foldlevelstart=99

set lazyredraw " don't update the display while executing macros

set laststatus=2 " Строка состояни

syntax enable " Включаем подсветку синтаксиса

set nocompatible " Включаем несовместимость настроек с vi

set incsearch " Поиск по набору текста

set hlsearch " Подсветка поиска

set magic " Set magic on, for regular expressions

set ignorecase " Searches are Non Case-sensitive

set smartcase

set showmatch " Подсветка парных скобок

set showcmd " Show incomplete cmds down the bottom

set showmode " Show current mode down the bottom

set title " Показ заголовка

set acd " Файловый менеджер всегда открывается в текущей директории при первом открытии файла

set expandtab " Использовать пробелы вместо табуляции

set autoread " Reload files changed outside automatically

set tabstop=4 " Количество пробелов, которыми символ табуляции отображается в тексте

set shiftwidth=4 " Bспользуется для регулирование ширины отступов в пробелах добавляемых командами >> и <<

set smarttab " Добавление отступа при нажатии tab в соответствии с настройками ширины отступа shiftwidth

set autoindent " Включить автоотступы

set smartindent " Умные отступы

"set nowrap " Отключаем перенос строк

set wrap " Включаем перенос строк

set noerrorbells visualbell t_vb= " Выключаем надоедливый звонок

set encoding=utf8 " Кодировка по умолчанию

set termencoding=utf-8 " Кодировка терминала

set fileencodings=utf8,cp1251 " Возможные кодировки файлов и последовательность определения

set mousehide " Прячим курсор мыши когда печатаем

set number " Включаем нумерацию строк

set numberwidth=4 " Ширина строки

set ruler " Показывать положение курсора всё время.

" set scrolloff=3 " Отступ от прокрутки

set mouse=a " Поддержка мыши

set mousemodel=popup

set hidden " Не выгружать буфер, когда переключаемся на другой

set nobackup " Выключаем резервные файлы

set noswapfile " Выключаем своп файлы

" set backupdir=/tmp/bac " Директория для backup файлов
" 
" set directory=/tmp/swp " Директория для swp файлов

set noautochdir " Выключаем автоматический переход в папку

set wildmenu " Включаем wildmenu для вводимых команд

set wildmode=list:longest,list:full  " Tab completion

set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git " Список игнорируемых файлов

set clipboard+=unnamed " Глобальный буфер обмена (теперь копипаст работает между системой в вимом)

set ttyfast

set path=.,,**

let loaded_matchparen=1 " Подсвечивать парные скобки

" По <leader>f открывается CtrlP
map <leader>f :CtrlP<CR>

" Переключение буферов по <leader>b
map <leader>b :CtrlPBuffer<CR>

" Используем <leader>l для включения неотображаемых символов
nmap <leader>l :set list!<CR>

let NERDTreeWinSize = 30 " Размер окна NERDTree

let NERDTreeDirArrows=1 " Показываем стрелки в директориях

let NERDTreeMinimalUI=1 " Minimal NERDTree interface

let NERDTreeChDirMode=2

let NERDTreeHijackNetrw=0

let NERDTreeIgnore = ['\.png$','\.pyc$', '\.db$', '\.git$', '*.\.o$', '.*\.out$', '.*\.so$', '.*\.a$', '.*\~$'] " Список игнорируемых файлов в NERDTree

" Отображаем NERDTree
map <leader>n :NERDTreeToggle<CR> 

set fillchars=stl:\ ,stlnc:\ ,vert:│

let g:pymode_rope = 1 " Enable pymode rope
let g:pymode_doc = 1 " Enable pymode documentation plugin
let g:pymode_doc_key = 'K' " pymode documentation plugin key

let g:pymode_lint = 0 " Disable python-mode linting for enable syntastic

let g:pymode_virtualenv = 1 " Python-mode support virtualenv

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0 " Don't autofold code

let g:pymode_breakpoint = 1 " Load breakpoint plugin

let g:pymode_breakpoint_key = '<leader>e' " leader + e set/unser breakpoint

let g:jedi#auto_initialization = 1 " Enable Jedi autocomplete

autocmd FileType python setlocal completeopt-=preview " Disable docstring window in Jedi

let g:jedi#completions_command="<leader>c" " leader + c jedi completion

let g:airline#extensions#tabline#enabled = 1 " Enable airline tabs

let g:airline#extensions#tabline#fnamemod = ':t' " :help filename-modifiers

let g:airline_powerline_fonts = 1 " Use airline fonts

" Make syntastic auto update the location list and make it also check
" when the file opens
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126 --max-line-length=84'
