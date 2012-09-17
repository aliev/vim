 if has('gui_macvim') " Если macvim
    " Удаляем тулбар
    set guioptions-=T
    set guioptions-=r
    set background=dark
    colors solarized
    let g:solarized_visibility="normal"
    set guifont=Monaco:h12
else " Если vim
  " Включаем 256 цветов в терминале, мы ведь работаем из иксов?
  " Нужно во многих терминалах, например в gnome-terminal
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

    " Отступы для различных языков
    au FileType ruby set shiftwidth=2
    au FileType javascript set shiftwidth=2
    au FileType php set shiftwidth=2
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
    ""set undofile
    "set undodir=~/.vim/tmp/undo/

    " Подсветка столбца в буфере, отобаражет правую границу и показывает какие
    " строки не влезли в 80 символов
    "set colorcolumn=80

    "для некоторых типов файлов настройки отступов были перенесены из plugin в
    "indent
    filetype plugin indent on
end

" Автокомплит для комманд
set wildmenu
set wildmode=list:longest

" Russian keymap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Команда для справок
"set keywordprg=man -s

" Включаем подсветку синтаксиса
syntax enable


" Включаем несовместимость настроек с vi
set nocompatible

" Поиск по набору текста (очень полезная функция)
set incsearch

" Проверка закрытия скобок (подсвечивает парную скобку)
set showmatch

" Показ заголовка
set title

" Файловый менеджер всегда открывается в текущей директории при первом открытии файла
set acd

" Настройка отступов
" Количество пробелов, которыми символ табуляции отображается в тексте
" 4 пробела если используется expandtab см. ниже
set tabstop=4

" Использовать пробелы вместо табуляции
set expandtab

" По умолчанию используется для регулирование ширины отступов в пробелах,
" добавляемых командами >> и <<
set shiftwidth=4

set breakat=" ^I!@*-+;:,./?"

" В случае включения этой опции, нажатие Tab в начале строки (если быть
" точнее, до первого непробельного символа в строке) приведет к добавлению
" отступа, ширина которого соответствует shiftwidth)
set smarttab

" Включить автоотступы
set autoindent

" Умные отступы
" Делает то же, что и autoindent плюс автоматически выставляет отступы в
" нужных местах. В частности, отступ ставится после строки, которая
" заканчивается символом {, перед строкой, которая заканчивается символом },
" удаляется перед символом #, если он следует первым в строке и т.д.
" (подробнее help 'smartindent').
set smartindent

" Автозакрытие парных символов
imap [ []<LEFT>
imap ( ()<LEFT>
inoremap (<CR>  (<CR>)<Esc>O
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Отключаем перенос строк
"set nowrap

" Включаем перенос строк
set wrap

" Выключаем надоедливый "звонок"
set visualbell t_vb=

" Кодировка
set encoding=utf8

" Кодировка текста по умолчанию должна совпадать с кодировкой терминала
set termencoding=utf-8

" Возможные кодировки файлов и последовательность определения
set fileencodings=utf8,cp1251

" Прячим курсор мыши когда печатаем
set mousehide

" Включаем нумерацию строк
set number
set numberwidth=4 " Ширина строки

" Подсветка текущей позиции курсора по горизонтали и вертикали
"set cursorline
"set cursorcolumn

" Показывать положение курсора всё время.
set ruler

" Поддержка мыши
set mouse=a
set mousemodel=popup

" Автозавершение. Слова откуда будем завершать
"set complete="" " Из файла
"set complete+=. " Из текущего буфера
"set complete+=k " Из словаря
"set complete+=b " Из других открытых буферов
"set complete+=t " Из тегов
"set completeopt+=preview " Включаем показ справки при автозавершении
"set dictionary=/usr/share/dict/words " Словари для автодополнения

" Строка состояния
if has('statusline')
    set laststatus=2
endif

" Фолдинг
set foldcolumn=2 " Ширина строки где располагается фолдинг
set foldmethod=manual " Фолдинг по отступам
set foldnestmax=10      " Глубина фолдинга 10 уровней
set nofoldenable        " Не фолдить по умолчанию
"set foldlevel=1         " This is just what i use

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без
" необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" Включаем загрузку filetype плагинов
filetype plugin on

" Включаем загрузку indent плагинов
filetype indent on

" Выключаем резервные и swp файлы
set nobackup
set noswapfile
"set backupdir=~/.vim/tmp/bac " Директория для backup файлов
"set directory=~/.vim/tmp/swp " Директория для swp файлов

" Показывать табы всегда
set showtabline=1

" Показывать неотображаемые символы
"set list

" Символ табуляции и конца строки
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

" Настраиваем CommandT для переключения между буферами
map <C-t> :CommandTBuffer<CR>

" Настраиваем Command-T для переключения между файлами
map <C-f> :CommandT<CR>

" Подсвечиваем ошибки под текстом волнистой чертой
hi Error guifg=NONE guibg=NONE gui=undercurl ctermfg=white ctermbg=red cterm=NONE guisp=#FF6C60

" Настраиваем NerdTree
let NERDTreeWinSize = 30 " Размер окна NERDTree
let NERDTreeDirArrows=1 " Показываем стрелки в директориях
let NERDTreeMinimalUI=1 " Минимальный интерфейс
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.o', '\.out'] " Игнорируемые файлы в NERDTree
"открываем и закрываем через CTRL+R
map <C-r> :NERDTreeToggle %:p:h<CR> 


let g:html_indent_inctags = "html,body,head,tbody" 
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Настройка Tagbar
let g:tagbar_autofocus = 1

" Настройка Powerline
let g:Powerline_symbols = 'unicode'
let g:Powerline_cache_enabled = 0
let g:Powerline_symbols_override = {
      \ 'BRANCH': [0x2213],
      \ 'LINE': [0x2213],
      \ }


" Для VimShell выключаем автоматический переход в директорию
set noautochdir 

" Сохранить через sudo командой :w!!
ca w!! w !sudo tee "%"

" Включить или выключить автозавершение кода
let g:neocomplcache_enable_at_startup = 0
