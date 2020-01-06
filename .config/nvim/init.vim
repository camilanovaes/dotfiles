" NEOVIM CONFIG FILE
"                       _ _            _       _   
"    ___ __ _ _ __ ___ (_) | __ _   __| | ___ | |_ 
"   / __/ _` | '_ ` _ \| | |/ _` | / _` |/ _ \| __|
"  | (_| (_| | | | | | | | | (_| || (_| | (_) | |_ 
"   \___\__,_|_| |_| |_|_|_|\__,_(_)__,_|\___/ \__|
"
" Author: Camila Novaes <novaes.csw@gmail.com>
"

" General configuration
set cursorline
set clipboard=unnamed
set laststatus=2
set tabstop=4
set number
set relativenumber
set colorcolumn=80

" Plugin configuration
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'		     " Powerline bar
Plug 'scrooloose/nerdtree'		     " Nerdtree
Plug 'tpope/vim-surround'		     " Surround for (, [, etc
Plug 'mattn/emmet-vim'			     " Emmet for HTML, CSS, etc
Plug 'junegunn/fzf'			     " Fuzzy search
Plug 'junegunn/fzf.vim'			     " Fuzzy search
Plug 'joshdick/onedark.vim'		     " One dark theme
Plug 'airblade/vim-gitgutter'		     " Git plugin
Plug 'ntpeters/vim-better-whitespace'	     " Show whitespaces

call plug#end()

" Neovim Theme
syntax on
colorscheme onedark

" NERD Tree
nmap <C-n> :NERDTreeToggle<CR>

" Highlighting and stripping whitespace on save
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save  = 1

" Split navigatiion
nnoremap <C-k> <C-W><C-K>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-l> <C-W><C-L>

" Laguages configuration
"" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
	\ set colorcolumn=80

let python_highlight_all=1
syntax on

" Js, HTML and CSS configs
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
