-- Remaps!
--
-- The keymaps can be defines via vim.keymap.set and it takes 4
-- arguments: mode, key, command, options

local remap = vim.keymap.set
local opts  = { noremap = true, silent = true }

-- source/edit init.lua
remap('n', '<leader>ce', ':edit $MYVIMRC<cr>', opts)
remap('n', '<leader>cs', ':source $MYVIMRC<CR>', opts)

-- make navigating around splits easier
remap('n', '<C-j>', '<C-w>j', opts)
remap('n', '<C-k>', '<C-w>k', opts)
remap('n', '<C-h>', '<C-w>h', opts)
remap('n', '<C-l>', '<C-w>l', opts)

-- open navigation tree
remap('n', '<C-n>', ':Vex<CR>', opts)

-- adjust split size easily
remap('n', '<C-Left>', ':vertical resize +3<CR>', opts)
remap('n', '<C-Right>', ':vertical resize -3<CR>', opts)
remap('n', '<C-Up>', ':resize +3<CR>', opts)
remap('n', '<C-Down>', ':resize -3<CR>', opts)

-- stop highlighting for the 'hlsearch'
remap('n', '<leader><esc>', ':nohlsearch<cr>', opts)

-- copy/paste text
remap('v', '<leader>y', '"+y', opts)
remap('n', '<leader>Y', '"+Y', opts)
remap('v', '<leader>p', '"_dP', opts)

-- move highlighted text
remap('v', 'J', ":m '>+1<CR>gv=gv")
remap('v', 'K', ":m '<-2<CR>gv=gv")

-- git
remap('n', '<leader>gb', ':Git blame<CR>', opts)
remap('n', '<leader>gs', ':vertical Git<CR>', opts)
remap('n', '<leader>gp', ':Git -c push.default=current push<CR>', opts)
remap('n', '<leader>gi', ':Git diff<CR>', opts)
remap('n', '<leader>gw', ':Gwrite<CR>', opts)
remap('n', '<leader>gl', ':GV<CR>', opts)

-- telescope
remap('n', '<C-p>', require('telescope.builtin').find_files, opts)
remap('n', '<C-t>', require('telescope.builtin').treesitter, opts)
remap('n', '<C-s>', require('telescope.builtin').grep_string, opts) -- need to install 'ripgrep'
remap('n', 'T', "<cmd>Telescope<cr>", opts)
remap('n', '<leader><space>', require('telescope.builtin').buffers, opts)
remap('n', '<leader>lg', require('telescope.builtin').live_grep, opts)
remap('n', '<leader>th', require('telescope.builtin').help_tags, opts)
remap('n', '<leader>gc', require('telescope.builtin').git_commits, opts)
remap('n', '<leader>tp', require('telescope').extensions.project.project, opts)

-- lsp
lsp_opts = { buffer = bufnr }
remap('n', '<leader>i', vim.lsp.buf.format, lsp_opts)
remap('n', '<leader>h', vim.lsp.buf.hover, lsp_opts)
remap('n', '<leader>dd', vim.diagnostic.open_float, lsp_opts)
remap('n', 'gD', vim.lsp.buf.declaration, lsp_opts)
remap('n', 'gd', vim.lsp.buf.definition, lsp_opts)
remap('n', 'gi', vim.lsp.buf.implementation, lsp_opts)
remap('n', 'gr', vim.lsp.buf.references, lsp_opts)

-- debug
remap('n', '<F5>', ":lua require('dap').continue()<cr>", lsp_opts)
remap('n', '<F10>', ":lua require('dap').step_into()<cr>", lsp_opts)
remap('n', '<F11>', ":lua require('dap').step_over()<cr>", lsp_opts)
remap('n', '<F12>', ":lua require('dap').step_out()<cr>", lsp_opts)
remap('n', '<leader>b', ":lua require('dap').toggle_breakpoint()<cr>", lsp_opts)
remap('n', '<leader>B', ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoing condition: '))<cr>", lsp_opts)
remap('n', '<leader>lp', ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  lsp_opts)
remap('n', '<leader>dr', ":lua require('dap').repl.open()<cr>", lsp_opts)
remap('n', '<F6>', ":lua require('dapui').open()<cr>", lsp_opts)
remap('n', '<F7>', ":lua require('dapui').close()<cr>", lsp_opts)

-- trouble
remap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
remap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
remap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
remap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
remap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
remap("n", "<leader>rr", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- rename variable
remap('n', '<F2>', "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- neotest
remap('n', '<leader>tt', "<cmd>lua require('neotest').run.run() <cr>", opts)
remap('n', '<leader>tf', "<cmd>lua require('neotest').run.run(vim.fn.expand('%')) <cr>", opts)
remap('n', '<leader>td', "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'}) <cr>", opts)
remap('n', '<leader>ts', "<cmd>lua require('neotest').summary.toggle() <cr>", opts)

-- scripts
remap('n', '<C-f>', ":!tmux neww tmux-session <cr>", opts)
remap('n', '<C-g>', ":!tmux neww tmux-switcher <cr>", opts)
