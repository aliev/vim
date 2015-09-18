" | vim-airline | {{{
let g:airline_powerline_fonts = 1 " Use airline fonts
" If you want to auto-completion to work stable in older vim, disable this option
let g:airline#extensions#tabline#enabled = 1
" Airline tabline settings
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_c = '%t'
" }}}

" | jedi-vim | {{{
let g:jedi#popup_on_dot = 1

let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#smart_auto_mappings = 0
" }}}

" | indentLine | {{{
" Make indent line faster
let g:indentLine_faster=1
" IndentLine character For use this feature please install patched font from repository root
let g:indentLine_char=nr2char(0xE0B4)
" }}}

" | vim-devicons | {{{
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 0
" }}}

" | nerdtree | leader+e, leader+E{{{
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = nr2char(0xE0B5)
let g:NERDTreeDirArrowCollapsible = nr2char(0xE0B6)
let NERDTreeIgnore = ['\.pyc$']

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
nnoremap <silent> <Leader>E :NERDTreeFind<CR>
" }}}

" | ultisnips | {{{
let g:UltiSnipsJumpForwardTrigger='<tab>'
" }}}

" | incsearch.vim | / ? g/ | {{{
let g:incsearch#auto_nohlsearch = 1

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}

" | vim-gitgutter | {{{
let g:gitgutter_max_signs=10000
" }}}

" | vim-togglecursor | {{{
let g:togglecursor_default="block"
let g:togglecursor_insert="line"
" }}}

" | vim-htmldjango_omnicomplete | {{{
if has("autocmd")
  au FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango
  au FileType htmldjango inoremap {% {%  %}<left><left><left>
  au FileType htmldjango inoremap {{ {{  }}<left><left><left>
endif
" }}}

" | Goto file with line number under cursor | gf | {{{
nnoremap gf gF
" }}}

" | List toggle | leader+l | {{{
nnoremap <silent> <Leader>l :set list!<CR>
" }}}

" | Close the current buffer and move to the previous one | leader+w | {{{
nnoremap <silent> <leader>w :bp <BAR> bd #<CR>
" }}}

" | Quickly jump by declarations list | :BTags |{{{
nnoremap <silent> <Leader>s :BTags<CR>
" }}}

" | Buffer list | leader+b | {{{
nnoremap <silent> <Leader>b :BList<CR>
" }}}

" | Open files in splits | leader+f | {{{
nnoremap <silent> <Leader>f :call fzf#run({
\   'down': '40%',
\   'sink': 'e' })<CR>
" }}}

" | Search word under cursor by using Ag | leader + a | {{{
noremap <silent><Leader>a :Ag <C-R>=expand("<cword>")<CR><CR>
" }}}

" | Color options | {{{
set background=dark
let base16colorspace=256
colors base16-eighties
" Disable background and foreground for vertical split
hi vertsplit ctermbg=NONE guibg=NONE
" }}}

nnoremap <silent><leader>[ :cprev<CR>
nnoremap <silent><leader>] :cnext<CR>

" vim:foldmethod=marker:foldlevel=0
