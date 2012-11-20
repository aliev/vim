 if has('gui_macvim') " Если macvim
    " Удаляем все ненужное
    set guioptions-=T
    set guioptions-=r
    set background=dark
    colors solarized
    set guifont=Monaco:h11
else
  set t_Co=256
endif

" Autocmd
if has("autocmd")
    " Для Drupal файлов *.module, *.install, *.test, *.inc, *.profile, *.view
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

" Проверяем версию Vim, если у нас 7.3 тогда:
if v:version >= 703
    " Нумерование строк не относительно начала файла, а относительно текущего
    " положения курсора. Я этой фичей не пользуюсь, поэтому отключил для себя
    "set relativenumber

    " Вечный undo. Теперь вся история редактирования файла хранится не только
    " в текущей сессии, но и в файле и востанавливается при перезапусках
    set undofile
    set undodir=~/.vim/tmp/undo/

    " Подсветка столбца в буфере, отобаражет правую границу и показывает какие
    " строки не влезли в 80 символов
    " set colorcolumn=80
    "для некоторых типов файлов настройки отступов были перенесены из plugin в
    "indent
end

filetype plugin indent on " Выключаем загрузку filetype и indent плагинов

set noautochdir " Выключаем автоматический переход в папку

set wildmenu " Автокомплит для комманд
set wildmode=list:longest

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

syntax enable " Включаем подсветку синтаксиса

set nocompatible " Включаем несовместимость настроек с vi

set incsearch " Поиск по набору текста

set hlsearch " Подсветка поиска

set showmatch " Подсветка парных скобок

set title " Показ заголовка

set acd " Файловый менеджер всегда открывается в текущей директории при первом открытии файла

" Настройка отступов
" Количество пробелов, которыми символ табуляции отображается в тексте
" 4 пробела если используется expandtab см. ниже
set tabstop=4

set expandtab " Использовать пробелы вместо табуляции

" По умолчанию используется для регулирование ширины отступов в пробелах,
" добавляемых командами >> и <<
set shiftwidth=4

set breakat=" ^I!@*-+;:,./?"

" В случае включения этой опции, нажатие Tab в начале строки (если быть
" точнее, до первого непробельного символа в строке) приведет к добавлению
" отступа, ширина которого соответствует shiftwidth)
set smarttab

set autoindent " Включить автоотступы

" Умные отступы
" Делает то же, что и autoindent плюс автоматически выставляет отступы в
" нужных местах. В частности, отступ ставится после строки, которая
" заканчивается символом {, перед строкой, которая заканчивается символом },
" удаляется перед символом #, если он следует первым в строке и т.д.
" (подробнее help 'smartindent').
set smartindent

"set nowrap " Отключаем перенос строк

set wrap " Включаем перенос строк

set visualbell t_vb= " Выключаем надоедливый "звонок"

set encoding=utf8 " Кодировка

set termencoding=utf-8 " Кодировка текста по умолчанию

set fileencodings=utf8,cp1251 " Возможные кодировки файлов и последовательность определения

set mousehide " Прячим курсор мыши когда печатаем

set number " Включаем нумерацию строк

set numberwidth=4 " Ширина строки

set cursorline " Подсветка текущей позиции курсора по горизонтали

"set cursorcolumn " Подсветка текущей позиции курсора по вертикали

set ruler " Показывать положение курсора всё время.

set mouse=a " Поддержка мыши
set mousemodel=popup

set foldcolumn=2 " Ширина строки где располагается фолдинг
set foldmethod=indent " Фолдинг по отступам
set foldnestmax=10      " Глубина фолдинга 10 уровней
set nofoldenable        " Не фолдить по умолчанию
set foldlevel=1         " This is just what i use

set hidden " Не выгружать буфер, когда переключаемся на другой

" set nobackup " Выключаем резервные файлы
" set noswapfile " Выключаем своп файлы
set backupdir=~/.vim/tmp/bac " Директория для backup файлов
set directory=~/.vim/tmp/swp " Директория для swp файлов

set showtabline=2 " Показывать строку вкладок всегда

" Неотображаемые символы
" Выключить - раскомментировать строку ниже
"set list
if has('multi_byte')
    if version >= 700
        set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
        "set listchars=tab:▸\ ,eol:¬ " Раскомментируйте и закомментируйте
        "строку выше, что бы использовать символ табуляции как в textmate
    else
        set listchars=tab:»\ ,trail:·,eol:¶,extends:>,precedes:<,nbsp:_
    endif
endif

" Символ, который будет показан перед перенесенной строкой
if has("linebreak")
      let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
endif

" ZenCoding
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" По Ctrl+F открывается Command-T
map <C-f> :CommandT<CR>

" Настраиваем NerdTree
let NERDTreeWinSize = 30 " Размер окна NERDTree
let NERDTreeDirArrows=1 " Показываем стрелки в директориях
let NERDTreeMinimalUI=1 " Минимальный интерфейс
map <C-r> :NERDTreeToggle %:p:h<CR> 

let g:html_indent_inctags = "html,body,head,tbody" 
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:tagbar_autofocus = 1 " Настройка Tagbar

" Строка состояния
if has('statusline')
    set laststatus=2
endif

" Настройка Powerline
let g:Powerline_symbols = 'unicode'
let g:Powerline_cache_enabled = 0 " Выключаем кеш
let g:Powerline_symbols_override = { 'LINE': [0x270F], }

" Сохранить через sudo командой :w!!
ca w!! w !sudo tee "%"

let g:neocomplcache_enable_at_startup = 1 " Включить или выключить автозавершение кода

" Включение и настройка syntastic
let g:syntastic_enable_signs=1
let g:syntastic_warning_symbol = nr2char(187) " Символ для ошибок Warning
let g:syntastic_error_symbol = nr2char(187) " Символ для ошибок Error

