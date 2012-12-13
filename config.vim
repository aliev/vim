if has('gui_running')
    " set guioptions-=m " убираем меню
    set guioptions-=T " убираем тулбар
    set guioptions-=r " убираем полосы прокрутки справа
    set guioptions-=L " убираем полосы прокрутки слева
    " set guioptions-=e " убираем вкладки GUI делаем их как в консоли
    " set cursorline " Подсветка текущей позиции курсора по горизонтали
    " set cursorcolumn " Подсветка текущей позиции курсора по вертикали
    set background=light " Темный фон
    colors codeschool " Цветовая схема
endif

if has('gui_macvim')
    " set guifont=Monaco:h12 " Шрифт по умолчанию
    set guifont=Menlo:h12 " Шрифт по умолчанию
elseif has('gui_gtk') || has('gui_gtk2')
    set guifont="Ubuntu Mono":h15 " Шрифт по умолчанию
elseif has('gui_win32')
else
  set t_Co=256 " 256 цветов для консоли
endif

if v:version >= 7
    "set relativenumber " Нумерование строк не относительно начала файла, а относительно текущего положения курсора

    set undofile " Включаем вечный undo
    set undodir=~/.vim/tmp/undo/ " Куда записывать файлы для undo

    " set colorcolumn=80 " Отображает правую границу
end

if has("autocmd")
    augroup module
        autocmd BufRead,BufNewFile *.module set filetype=php
        autocmd BufRead,BufNewFile *.install set filetype=php
        autocmd BufRead,BufNewFile *.test set filetype=php
        autocmd BufRead,BufNewFile *.inc set filetype=php
        autocmd BufRead,BufNewFile *.profile set filetype=php
        autocmd BufRead,BufNewFile *.view set filetype=php
    augroup END

    au FileType ruby set shiftwidth=2
    au FileType javascript set shiftwidth=2
    au FileType php set shiftwidth=4
    au FileType python set shiftwidth=4


    " No formatting on o key newlines
    autocmd BufNewFile,BufEnter * set formatoptions-=o

    " No more complaining about untitled documents
    autocmd FocusLost silent! :wa

    " When editing a file, always jump to the last cursor position.
    " This must be after the uncompress commands.
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line ("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif

"set list " Неотображаемые символы
if has('multi_byte')
    if version >= 700
        set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
        "set listchars=tab:▸\ ,eol:¬ " Раскомментируйте и закомментируйте
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

set ttimeoutlen=50  " Ускоряем работу Esc

" set showtabline=2 " Показывать строку вкладок всегда

set laststatus=2 " Строка состояни

set wildmenu " Включаем wildmenu для вводимых команд

set wildmode=list:longest " Настройка wildmenu

syntax enable " Включаем подсветку синтаксиса

set nocompatible " Включаем несовместимость настроек с vi

set incsearch " Поиск по набору текста

set hlsearch " Подсветка поиска

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

set visualbell t_vb= " Выключаем надоедливый звонок

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

" set nobackup " Выключаем резервные файлы

" set noswapfile " Выключаем своп файлы

set backupdir=~/.vim/tmp/bac " Директория для backup файлов

set directory=~/.vim/tmp/swp " Директория для swp файлов

set noautochdir " Выключаем автоматический переход в папку

set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git " Игнорируемые файлы

source ~/.vim/plugins.vim " Настройки плагинов
