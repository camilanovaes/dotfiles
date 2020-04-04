" NEOVIM CONFIGURATION
"
" Author: Camila Novaes <novaes.csw@gmail.com>
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'						   	" Powerline bar
Plug 'scrooloose/nerdtree'								" Nerdtree
Plug 'mattn/emmet-vim'									" Emmet
Plug 'junegunn/fzf'										" Fuzzy search
Plug 'junegunn/fzf.vim'									" Fuzzy search
Plug 'drewtempelmeyer/palenight.vim'					" Palenight theme
Plug 'airblade/vim-gitgutter'							" Git plugin
Plug 'ntpeters/vim-better-whitespace'					" Show whitespaces
Plug 'sheerun/vim-polyglot'								" Highlighting
Plug 'tpope/vim-fugitive'                               " Git plugin
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'								" Surround for (, [
Plug 'tpope/vim-commentary'								" Commentary
Plug 'lervag/vimtex'									" Latex plugin
Plug 'plasticboy/vim-markdown'							" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ycm-core/YouCompleteMe'
Plug 'machakann/vim-highlightedyank'					" Highlight yank
Plug 'tmhedberg/SimpylFold'								" Fold
Plug 'christoomey/vim-tmux-navigator'					" Tmux

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To install YouCompleteME, run:
" python3 -m pip install neovim
" python3 install.py --clang-completer
" To copy into the system clipboard on debian-systems, install:
" apt install xclip
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" THEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neovim Theme
syntax enable
set termguicolors

" Palenight
set background=dark
colorscheme palenight

" Configure airline color
let g:airline_theme = "palenight"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL MAPPING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight yank configuration
hi HighlightedyankRegion cterm=reverse gui=reverse

" Disable window preview
set completeopt-=preview

" Highlighting and stripping whitespace on save
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save  = 1

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

