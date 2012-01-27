if has('gui_running') " Если gvim
    " Удаляем тулбар
    set guioptions-=T
else " Если vim
    "let moria_style = 'ligth'
    "let moria_monochrome = 0
    "colors moria
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
    "set colorcolumn=80

    "для некоторых типов файлов настройки отступов были перенесены из plugin в
    "indent
    filetype plugin indent on
end

" Автокомплит для комманд
set wildmenu

" Russian keymap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Команда для справок
"set keywordprg=man -s

" Включаем подсветку синтаксиса
syntax enable


" Включаем 256 цветов в терминале, мы ведь работаем из иксов?
" Нужно во многих терминалах, например в gnome-terminal
set t_Co=256

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

" Если мы используем Ruby, тогда сделать отступы в 2 пробела
au FileType ruby set shiftwidth=2
au FileType javascript set shiftwidth=2
au FileType php set shiftwidth=4
au FileType python set shiftwidth=4

set breakat=" ^I!@*-+;:,./?"

" В случае включения этой опции, нажатие Tab в начале строки (если быть
" точнее, до первого непробельного символа в строке) приведет к добавлению
" отступа, ширина которого соответствует shiftwidth)
set smarttab

" Умные отступы
" Делает то же, что и autoindent плюс автоматически выставляет отступы в
" нужных местах. В частности, отступ ставится после строки, которая
" заканчивается символом {, перед строкой, которая заканчивается символом },
" удаляется перед символом #, если он следует первым в строке и т.д.
" (подробнее help 'smartindent').
set smartindent

" Отключаем перенос строк
"set nowrap

" Включаем перенос строк
set wrap

" Включить автоотступы
set autoindent

" Выключаем надоедливый "звонок"
set novisualbell
set t_vb=

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
set complete="" " Из файла
set complete+=. " Из текущего буфера
set complete+=k " Из словаря
set complete+=b " Из других открытых буферов
set complete+=t " Из тегов
set completeopt+=preview " Включаем показ справки при автозавершении
set dictionary=/usr/share/dict/words " Словари для автодополнения

" Автоматическое закрытие скобок
imap [ []<LEFT>
imap ( ()<LEFT>
imap {<CR> {<CR>}<Esc>O

" Формат строки состояния
"set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set statusline=Line\ Number:\ %l\ Encoding:\ %{&encoding}\ Filename:\ %f
set laststatus=2

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
"set nobackup
set backupdir=~/.vim/tmp/bac " Директория для backup файлов
set noswapfile
"set directory=~/.vim/tmp/swp " Директория для swp файлов

" Показывать табы всегда
set showtabline=2

"""""""""""""""""Тут настройки для спец символов""""""""""""""""""""""""""""""""""""
" Показывать неотображаемые символы
"set list

" Символ табуляции и конца строки
if has('multi_byte')
    if version >= 700
        "set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
        set listchars=tab:▸\ ,eol:¬ " Раскомментируйте и закомментируйте
        "строку выше, что бы использовать символ табуляции как в textmate
    else
        "set listchars=tab:»\ ,trail:·,eol:¶,extends:>,precedes:<,nbsp:_
    endif
endif

" Символ, который будет показан перед перенесенной строкой
if has("linebreak")
      let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Клавиатурные комбинации
source ~/.vim/keys.vim

" MyTabLine
source ~/.vim/mytabline.vim

hi Error guifg=NONE guibg=NONE gui=undercurl ctermfg=white ctermbg=red cterm=NONE guisp=#FF6C60


" Это для друпала
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif

" Настраиваем NerdTree
let NERDTreeWinSize = 40
let NERDTreeDirArrows=1

" Сохраняем расположение вкладок
"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview
let g:html_indent_inctags = "html,body,head,tbody" 
map ,p :FufFile()<CR>

hi IndentGuidesEven ctermbg=lightgrey 
hi IndentGuidesOdd  ctermbg=white 
