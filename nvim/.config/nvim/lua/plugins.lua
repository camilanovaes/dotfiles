-- plugins.lua

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Nerdtree in lua
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- Git
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'

  -- Visual
  use {'dracula/vim', as = 'dracula'}
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }


end)
