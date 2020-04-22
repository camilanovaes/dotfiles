" NEOVIM CONFIGURATION
"
" Author: Camila Novaes <novaes.csw@gmail.com>
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline						" Highlight current line
set clipboard=unnamedplus			" Copy to system clipboard by default
set laststatus=2					" Always show statusline
set tabstop=4 softtabstop=4			" One tab == four spaces
set shiftwidth=4					" One tab == four spaces
set noexpandtab
set smartindent						" Be smart when indenting :P
set smarttab						" Be smart using tabs :B
set number relativenumber			" Set relative line numbers
set textwidth=80					" Define text width
set colorcolumn=+1
set mouse=a							" Enable mouse support in all vim modes
set inccommand=nosplit
set nobackup						" No auto backups
set noswapfile						" No swap file
set incsearch						" Incremental search
set splitbelow splitright			" Set new split below/right

let mapleader = " "					" Set space bar as leader key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Basics
Plug 'tpope/vim-surround'								" Surround for (, [
Plug 'tpope/vim-commentary'								" Commentary
Plug 'lervag/vimtex'									" Latex plugin
Plug 'plasticboy/vim-markdown'							" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'mbbill/undotree'									" Undo history
Plug 'sheerun/vim-polyglot'								" Language pack

" Git
Plug 'junegunn/gv.vim'									" Git plugin
Plug 'tpope/vim-fugitive'                               " Git plugin

" File management
Plug 'scrooloose/nerdtree'								" Nerdtree
Plug 'junegunn/fzf'										" Fuzzy search
Plug 'junegunn/fzf.vim'									" Fuzzy search

" Productivity
Plug 'christoomey/vim-tmux-navigator'					" Tmux
Plug 'tmhedberg/SimpylFold'								" Fold
Plug 'airblade/vim-gitgutter'							" Git plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}			" Autocomplete

" Colors and themes
Plug 'machakann/vim-highlightedyank'					" Highlight yank
Plug 'vim-airline/vim-airline'						   	" Powerline bar
Plug 'drewtempelmeyer/palenight.vim'					" Palenight theme
Plug 'ntpeters/vim-better-whitespace'					" Show whitespaces
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " Python Highlighting

call plug#end()


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
" NAVIGATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Adjust split size easily
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert/horiz or horiz/vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTREE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-n> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUZZYSEARCH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-space> :GFiles<CR>
nnoremap <silent> <C-T> :Ag<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GIT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gs :vertical Gstatus<CR>
nmap <Leader>gc :Gcommit -v<CR>
nmap <Leader>ga :Git add -p<CR>
nmap <Leader>gm :Gcommit --amend<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>gi :Gdiff<CR>
nmap <Leader>gw :Gwrite<CR>

" GV - Git commit browser
nmap <Leader>gl :GV<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UNDO HISTORY
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>u :UndotreeShow<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable window preview
set completeopt-=preview

" Give more space for displaying messages.
set cmdheight=2

" Set update time
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHERS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hightlight yank
hi HighlightedyankRegion cterm=reverse gui=reverse

" Highlighting and stripping whitespace on save
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save  = 1

" Open terminal inside vim
map <Leader>tt :bel 10 split term://zsh<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PYTHON
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Highlighting
let python_highlight_all=1

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif


