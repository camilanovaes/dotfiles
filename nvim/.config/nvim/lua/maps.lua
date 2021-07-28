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
remap('n', '<leader>p', ':bnext<cr>', opts)
remap('n', '<leader>o', ':bprev<cr>', opts)

-- nerdtree
remap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

-- compe
remap('i', '<expr> <C-Space>', 'compe#complete()', opts)
remap('i', '<expr> <CR>', "compe#confirm('<CR>')", opts)
remap('i', '<expr> <C-',  "compe#close('<C-e>')", opts)
remap('i', '<expr> <C-',  "compe#scroll({ 'delta': +4 })", opts)
remap('i', '<expr> <C-',  "compe#scroll({ 'delta': -4 })", opts)

-- git
remap('n', '<leader>gb', ':Gblame<CR>', opts)
remap('n', '<leader>gs', ':vertical Git<CR>', opts)
remap('n', '<leader>gp', ':Git push<Space>', opts)
remap('n', '<leader>gi', ':Gdiff<CR>', opts)
remap('n', '<leader>gw', ':Gwrite<CR>', opts)
remap('n', '<leader>gk', ':Glog<CR>', opts)
remap('n', '<leader>gc', ':GCheckout<CR>', opts)
remap('n', '<leader>gl', ':GV<CR>', opts)

-- telescope
remap('n', '<C-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
remap('n', '<C-f>', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
remap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
remap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

