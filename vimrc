set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
"
Bundle 'flazz/vim-colorschemes.git'
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }

" Ruby
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails.git'
Bundle 'nelstrom/vim-textobj-rubyblock'

" HTML/CSS
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'mattn/zencoding-vim'
Bundle 'gregsexton/MatchTag'

" JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'

" Tools
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet.git'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/matchit.zip'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'git://github.com/kana/vim-textobj-user.git'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'tpope/vim-fugitive'
Bundle 'shemerey/vim-peepopen'
Bundle 'vim-scripts/sudo.vim.git'

filetype plugin indent on     " required!

"""""""""""""""""""""""""
"                       "
" Базовые настройки     "
"                       "
"""""""""""""""""""""""""

function

if has('gui_running') " Глобальные настройки на GUI Vim
    set guioptions-=m " убираем меню
    " set guioptions-=e " убираем вкладки GUI делаем их как в консоли
    set guioptions-=T " убираем тулбар
    set guioptions-=r " убираем полосы прокрутки справа
    set guioptions-=L " убираем полосы прокрутки слева
    set background=light " Цвет фона темный или светлый
    set guioptions-=R
    set guioptions-=l
    set background=light
    colors Stark " Цветовая схема по умолчанию
endif

if has('gui_macvim') " Для GUI Macvim
    " set guifont=Monaco:h12 " Шрифт по умолчанию
    set guifont=Menlo\ Regular\ for\ Powerline:h12 " Шрифт по умолчанию
    set fuoptions=maxvert,maxhorz
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
        " set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
        set listchars=tab:▸\ ,eol:¬ " Раскомментируйте и закомментируйте
        "строку выше, что бы использовать символ табуляции как в textmate
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

set ttimeoutlen=50  " Ускоряем работу Esc

" set showtabline=2 " Показывать строку вкладок всегда

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

" let loaded_matchparen=1 " не подсвечивать парные скобки

""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                "
" Настройки для плагинов и комбинации клавиатуры "
"                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""

" :W! сохраняет файл под рутом
ca W! %!sudo tee > /dev/null % 

" ZenCoding
let g:use_zen_complete_tag = 1
let g:user_zen_expandabbr_key = '<leader>e' " по leader e будет работать zen coding

" По <leader>f открывается Command-T
map <leader>f :CommandT<CR>
" Переключение буферов по <leader>b
map <leader>b :CommandTBuffer<CR>
let g:CommandTNeverShowDotFiles=1 " Не показывать файлы которые начинаются с точки
let CommandTMaxHeight=30 " Количество отображаемых файлов в списке Command-T

" Настраиваем NerdTree
let NERDTreeWinSize = 30 " Размер окна NERDTree
let NERDTreeDirArrows=1 " Показываем стрелки в директориях
let NERDTreeMinimalUI=1 " Минимальный интерфейс
let NERDTreeChDirMode=2
let NERDTreeHijackNetrw=0
let NERDTreeIgnore = ['\.png$','\.pyc$', '\.db$', '\.git$', '*.\.o$', '.*\.out$', '.*\.so$', '.*\.a$', '.*\~$'] " Список игнорируемых файлов в NERDTree

" Отображаем NERDTree
map <leader>n :call ToggleNERDTreeAndTagbar()<CR> 

let g:tagbar_autofocus = 1 " Настройка Tagbar
let tagbar_singleclick = 1
let g:tagbar_sort = 0

" Session options
let g:session_autoload = 1
let g:session_autosave = 1

let g:neocomplcache_enable_at_startup = 1 " Включить или выключить автозавершение кода

" Включение и настройка syntastic
let g:syntastic_enable_signs=0

" Настройка vim JavaScript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Настройки для Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 0 " Отключаем кеш в Powerline

" Запоминаем последнее расположение курсора в файле
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Функция открытия nerdtree и tagbar
function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
