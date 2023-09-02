
"https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation"
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

Plug 'junegunn/vim-plug'
Plug 'github/copilot.vim'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'

" LSP 
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

call plug#end()
