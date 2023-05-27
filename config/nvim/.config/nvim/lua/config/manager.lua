-- Manager the neovim plugins

-- Install lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Basics
  'tpope/vim-commentary',
  'tpope/vim-sleuth',
  'windwp/nvim-autopairs',

  -- Git
  'tpope/vim-fugitive',
  'junegunn/gv.vim',
  'lewis6991/gitsigns.nvim',

  {
    -- LSP
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim', opts = {} },
    },
  },
  {
    -- Highlight, edit and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      'hrsh7th/cmp-buffer',
      'hrsh7th/nvim-cmp',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    },
  },
  {
    -- Finder
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-project.nvim',
    },
  },

  -- Visual
  { "catppuccin/nvim", name = "catppuccin" },
  'Mofiqul/dracula.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'nvim-lualine/lualine.nvim',

  {
    -- Debuging
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-telescope/telescope-dap.nvim',
    },
  },
}, {})
-- return require('packer').startup(function() -- Packer can manage itself
--   use 'wbthomason/packer.nvim'

--   -- Terminal
--   use 'akinsho/toggleterm.nvim'

--   -- LSP + Autocomplete + Syntax
--   use 'neovim/nvim-lspconfig'
--   use 'hrsh7th/cmp-nvim-lsp'
--   use 'hrsh7th/cmp-buffer'
--   use 'hrsh7th/nvim-cmp'
--   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
--   use 'nvim-treesitter/playground'

--   -- Finder
--   use 'nvim-lua/popup.nvim'
--   use 'nvim-lua/plenary.nvim'
--   use 'nvim-telescope/telescope.nvim'
--   use 'nvim-telescope/telescope-project.nvim'
--   use 'ahmedkhalf/project.nvim'

--   -- Nerdtree in lua
--   use 'kyazdani42/nvim-web-devicons'
--   use 'kyazdani42/nvim-tree.lua'

--   -- Git
--   use 'tpope/vim-fugitive'
--   use 'junegunn/gv.vim'
--   use 'lewis6991/gitsigns.nvim'

--   -- Visual
--   use 'Mofiqul/dracula.nvim'
--   use 'lukas-reineke/indent-blankline.nvim'
--   use 'nvim-lualine/lualine.nvim'

--   -- VHDL
--   use 'suoto/hdl_checker'

--   -- Python linting and formating
--   use 'jose-elias-alvarez/null-ls.nvim'

--   -- Error handler
--   -- Lua
--   use { "folke/trouble.nvim",
--     requires = "kyazdani42/nvim-web-devicons",
--   }

--   -- Trailing whitespace
--   use 'ntpeters/vim-better-whitespace'

--   -- Test
--   use { "nvim-neotest/neotest",
--     requires = {
--       "nvim-neotest/neotest-python",
--       "nvim-lua/plenary.nvim",
--       "nvim-treesitter/nvim-treesitter",
--       "antoinemadec/FixCursorHold.nvim"
--     }
--   }

-- end)
