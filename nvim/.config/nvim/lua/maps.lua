-- maps.lua
-- The keymaps can be defines via vim.api.nvim_set_keymap and it takes 4
-- arguments: mode, key, command, options

local remap  = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- map the leader key 
remap('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

-- source/edit init.lua
remap('n', '<leader>ce', ':edit $MYVIMRC<cr>', opts)
remap('n', '<leader>cs', ':source $MYVIMRC<CR>', opts)

-- make navigating around splits easier
remap('n', '<C-j>', '<C-w>j', opts)
remap('n', '<C-k>', '<C-w>k', opts)
remap('n', '<C-h>', '<C-w>h', opts)
remap('n', '<C-l>', '<C-w>l', opts)

-- adjust split size easily
remap('n', '<C-Left>', ':vertical resize +3<CR>', opts)
remap('n', '<C-Right>', ':vertical resize -3<CR>', opts)
remap('n', '<C-Up>', ':resize +3<CR>', opts)
remap('n', '<C-Down>', ':resize -3<CR>', opts)

-- stop highlighting for the 'hlsearch' 
remap('n', '<leader><esc>', ':nohlsearch<cr>', opts)

-- navigation between buffers 
remap('n', '<leader>n', ':bnext<cr>', opts)
remap('n', '<leader>p', ':bprev<cr>', opts)

-- nerdtree
remap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
