"""""""
"
" Файл настроек для расширений
" его можно смело отключить если в каких то расширениях нет необходимости
"
"""""""

" ZenCoding
let g:use_zen_complete_tag = 1
let g:user_zen_expandabbr_key = '<leader>e' " по leader e будет работать zen coding

" По <leader>f открывается Command-T
" Для файлов
map <leader>f :CommandT<CR>
" Буферов
map <leader>b :CommandTBuffer<CR>
let g:CommandTNeverShowDotFiles=1 " Не показывать файлы которые начинаются с точки
let CommandTMaxHeight=10 " Количество отображаемых файлов в списке Command-T

" Настраиваем NerdTree
let NERDTreeWinSize = 30 " Размер окна NERDTree
let NERDTreeDirArrows=1 " Показываем стрелки в директориях
let NERDTreeMinimalUI=1 " Минимальный интерфейс
let NERDTreeChDirMode=1
let NERDTreeIgnore = ['\.pyc$', '\.db$', '\.git$'] " Список игнорируемых файлов в NERDTree

" Отображаем NERDTree и Tagbar
map <leader>r :call ToggleNERDTreeAndTagbar()<CR> 
let g:tagbar_autofocus = 1 " Настройка Tagbar

" Настройки для Powerline
let g:Powerline_symbols = 'unicode'
let g:Powerline_cache_enabled = 0 " Выключаем кеш
" let g:Powerline_symbols_override = { 'LINE': [0x270F], }

let g:neocomplcache_enable_at_startup = 1 " Включить или выключить автозавершение кода

" Включение и настройка syntastic
let g:syntastic_enable_signs=1
let g:syntastic_warning_symbol = 'W' " Символ для ошибок Warning
let g:syntastic_error_symbol = nr2char(187) " Символ для ошибок Error

" Настройка vim JavaScript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Функция для отображения NERDTree и Tagbar
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

" Задаем собственные функции для назначения имен заголовкам табов -->
    function MyTabLine()
        let tabline = ''

        " Формируем tabline для каждой вкладки -->
            for i in range(tabpagenr('$'))
                " Подсвечиваем заголовок выбранной в данный момент вкладки.
                if i + 1 == tabpagenr()
                    let tabline .= '%#TabLineSel#'
                else
                    let tabline .= '%#TabLine#'
                endif

                " Устанавливаем номер вкладки
                let tabline .= '%' . (i + 1) . 'T'

                " Получаем имя вкладки
                let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} |'
            endfor
        " Формируем tabline для каждой вкладки <--

        " Заполняем лишнее пространство
        let tabline .= '%#TabLineFill#%T'

        " Выровненная по правому краю кнопка закрытия вкладки
        if tabpagenr('$') > 1
            let tabline .= '%=%#TabLine#%999XX'
        endif

        return tabline
    endfunction

    function MyTabLabel(n)
        let label = ''
        let buflist = tabpagebuflist(a:n)

        " Имя файла и номер вкладки -->
            let label = substitute(bufname(buflist[tabpagewinnr(a:n) - 1]), '.*/', '', '')

            if label == ''
                let label = '[No Name]'
            endif

            let label .= ' (' . a:n . ')'
        " Имя файла и номер вкладки <--

        " Определяем, есть ли во вкладке хотя бы один
        " модифицированный буфер.
        " -->
            for i in range(len(buflist))
                if getbufvar(buflist[i], "&modified")
                    let label = '[+] ' . label
                    break
                endif
            endfor
        " <--

        return label
    endfunction

    function MyGuiTabLabel()
        return '%{MyTabLabel(' . tabpagenr() . ')}'
    endfunction

    set tabline=%!MyTabLine()
    set guitablabel=%!MyGuiTabLabel()
" Задаем собственные функции для назначения имен заголовкам табов <--


