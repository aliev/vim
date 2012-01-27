" Select all Ctrl+a
map <C-a> ggVG

" Save Ctrl+s
map <C-s> :w<CR>

" Paste Ctrl+p
map <C-p> :r !xclip -o<CR>

" ZenCoding
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" Swap line up/Swap line down
map <C-S-down> ddp
map <C-S-up> ddkP

" go to adjacent folds
nnoremap <C-Up> zk
nnoremap <C-Down> zj
nnoremap <C-Left> [[
nnoremap <C-Right> ]]

" Open and close nerd tree
map <C-r> :NERDTreeToggle<CR>
