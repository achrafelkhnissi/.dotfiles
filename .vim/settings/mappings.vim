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

" Esc
imap fj <Esc>
imap jf <Esc>

" Command-mode
nnoremap ; :

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Navigation
noremap K {
noremap J }
noremap L 0
noremap H $

" Insert mode navigation
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Indentation
map <Tab> >>
map <S-Tab> <<

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
