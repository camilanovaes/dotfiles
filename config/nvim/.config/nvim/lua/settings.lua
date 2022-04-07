-- General neovim configuration
-- Author: Camila Novaes <novaes.csw@gmail.com>

local o  = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options
o.mouse         = "a"
o.inccommand    = "nosplit"
o.background    = "dark"
o.completeopt   = "menuone,noselect"
o.swapfile      = false
o.smartcase     = true
o.laststatus	= 2
o.incsearch     = true
o.hlsearch      = false
o.ignorecase    = true
o.errorbells    = false
o.scrolloff     = 8
o.smarttab      = true
o.backup        = false
o.splitbelow    = true
o.splitright    = true
o.showmode      = false
o.termguicolors = true

-- window-local options
wo.number         = true
wo.relativenumber = true
wo.cursorline     = true
wo.colorcolumn    = "80"
wo.conceallevel   = 0

-- buffer-local options
bo.swapfile    = false
bo.tabstop     = 2
bo.softtabstop = 2
bo.shiftwidth  = 2
bo.expandtab   = true
bo.smartindent = true
bo.textwidth   = 79
bo.swapfile    = false
bo.undofile    = true

