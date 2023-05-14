-- init.lua

-- Set the leader key.
-- It must be set before the other configuration are loaded to make sure the
-- correct leader key are used in all files.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config")
require("plugins")
