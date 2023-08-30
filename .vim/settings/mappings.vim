" Key mappings :h map.txt
let mapleader = "\<Space>"  " Set leader to space

nnoremap <leader>s :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>f :FZF<CR>
inoremap <leader>e <Esc>
nnoremap <leader>r :source %

"imap <silent><script><expr> <C-J> copilot#Accept("\CR>")
"let g:copilot_no_tab_map = v:true

