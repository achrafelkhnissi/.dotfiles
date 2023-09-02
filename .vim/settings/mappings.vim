" Key mappings :h map.txt
let mapleader = "\<Space>"  " Set leader to space

nnoremap <leader>s :w!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>f :FZF --exact<CR>
inoremap <leader>e <Esc>
nnoremap <leader>r :source %

"imap <silent><script><expr> <C-J> copilot#Accept("\CR>")
"let g:copilot_no_tab_map = v:true

" Comment line
noremap <leader>/ :call CommentLine()<CR>

" Open file explorer
nnoremap <leader>e :Ex<CR>

" Make the current file executable
nnoremap <leader>x :!chmod +x %<CR>

" Execute current file
nnoremap <leader>r :!%<CR>

" Open terminal
nnoremap <leader>t :terminal<CR>
