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

let g:tagbar_autofocus = 1 " Настройка Tagbar

" Настройка Powerline
let g:Powerline_symbols = 'unicode'
let g:Powerline_cache_enabled = 0 " Выключаем кеш
let g:Powerline_symbols_override = { 'LINE': [0x270F], }

" Сохранить через sudo командой :w!!
ca w!! w !sudo tee "%"

let g:neocomplcache_enable_at_startup = 1 " Включить или выключить автозавершение кода

" Включение и настройка syntastic
let g:syntastic_enable_signs=1
let g:syntastic_warning_symbol = 'W' " Символ для ошибок Warning
let g:syntastic_error_symbol = nr2char(187) " Символ для ошибок Error

