
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
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartindent
set smarttab
set number
set relativenumber
set textwidth=80
set colorcolumn=+1
set mouse=a
set inccommand=nosplit
" set foldmethod=expr

" Plugin configuration
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'						   	" Powerline bar
Plug 'scrooloose/nerdtree'								" Nerdtree
Plug 'mattn/emmet-vim'									" Emmet
Plug 'junegunn/fzf'										" Fuzzy search
Plug 'junegunn/fzf.vim'									" Fuzzy search
Plug 'joshdick/onedark.vim'								" One dark theme
Plug 'airblade/vim-gitgutter'							" Git plugin
Plug 'ntpeters/vim-better-whitespace'					" Show whitespaces
Plug 'sheerun/vim-polyglot'								" Highlighting
Plug 'tpope/vim-fugitive'                               " Git plugin
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'								" Surround for (, [
Plug 'tpope/vim-commentary'								" Commentary
Plug 'junegunn/gv.vim'									" Git browser
Plug 'lervag/vimtex'									" Latex plugin
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'							" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }				" Vimwiki
Plug 'ycm-core/YouCompleteMe'
Plug 'neomake/neomake'									" Syntax check
Plug 'machakann/vim-highlightedyank'					" Highlight yank
Plug 'tmhedberg/SimpylFold'								" Fold
Plug 'christoomey/vim-tmux-navigator'					" Tmux

call plug#end()

" NOTE:
" To install YouCompleteME, run:
" python3 -m pip install neovim
" python3 install.py --clang-completer
" To copy into the system clipboard on debian-systems, install:
" apt install xclip

" Neovim Theme
syntax enable
colorscheme onedark

" Highlight yank configuration
hi HighlightedyankRegion cterm=reverse gui=reverse

" General mapping
nmap <space>h :wincmd h<CR>
nmap <space>j :wincmd j<CR>
nmap <space>k :wincmd k<CR>
nmap <space>l :wincmd l<CR>
nmap <space>y "+y
nmap <space><space> V
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" NERD Tree
nmap <C-n> :NERDTreeToggle<CR>

" Disable window preview
set completeopt-=preview

" Highlighting and stripping whitespace on save
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save  = 1

" Python syntax check
let g:neomake_python_enabled_makers = ['pylint']

" YouCompleteMe
nnoremap <silent> <space>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <space>gf :YcmCompleter FixIt<CR>

" Fuzzy search
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-space> :GFiles<CR>
nnoremap <silent> <C-T> :Ag<CR>

" Fugitive config
nmap <space>gb :Gblame<CR>
nmap <space>gs :vertical Gstatus<CR>
nmap <space>gc :Gcommit -v<CR>
nmap <space>ga :Git add -p<CR>
nmap <space>gm :Gcommit --amend<CR>
nmap <space>gp :Gpush<CR>
nmap <space>gi :Gdiff<CR>
nmap <space>gw :Gwrite<CR>
nmap <space>gl :GV<CR>

" Gbrowser configuration
let g:github_enterprise_urls = ['https://gitlab.lasse.ufpa.br']

" Vimwiki config to support markdown
let g:vimwiki_list = [{ 'path': '~/Documents/notes/',
       \ 'syntax':'markdown', 'ext': '.md' }]
let g:vimwiki_folding = 'expr'
autocmd FileType vimwiki set ft=markdown

" Disable folding with vim-markdown plugin
let g:vim_markdown_folding_disabled = 1

" Laguages configuration
"" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

let python_highlight_all=1
syntax on

" Js, HTML and CSS configs
"au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=2 |
"    \ set softtabstop=2 |
"    \ set shiftwidth=2 |

