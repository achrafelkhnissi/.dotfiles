syntax on

set hidden
set encoding=utf-8
set number
set ruler
set shiftwidth=2
set expandtab
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set laststatus=2
set showcmd
set visualbell
set mouse=a
" set colorcolumn=80
set t_Co=256
set background=dark
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set magic
set nocompatible

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off
set nobackup
set nowb
set noswapfile

" Tabs and spaces
set tabstop=2
set shiftwidth=4
set autoindent
set smartindent

" File type detection
filetype on
filetype plugin on
filetype indent on

" Cursor line and column
"set cursorcolumn
set cursorline

" Ignore these files
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"colorscheme onedark
"let g:onedark_terminal_italics=1
"let g:airline_theme='onedark'
"let g:onedark_background='dark'

" imap <silent><script><expr> <C-J> copilot#Accept("\CR>")
" let g:copilot_no_tab_map = v:true

let g:ycm_key_list_select_completion = ['<leader>Tab']
let g:ycm_key_list_previous_completion = ['<leader>Tab']

" Syntastic
let g:syntastic_python_checkers = ['pycodestyle']

