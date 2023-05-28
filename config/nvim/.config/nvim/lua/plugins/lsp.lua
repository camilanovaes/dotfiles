-- LSP config
local lspconfig = require("lspconfig")

-- TODO: Read about the adicional capabilities from cmp_nvim_lsp and how this
-- is used by broadcasting it to the servers above.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lspconfig.pyright.setup{
  on_attach = function()
    -- Add keymap when attach with pyright (only inside the current buffer)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
  end,
  capabilities = capabilities,
}

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      telemetry = { enable = false },
      workspace = { checkThirdParty = false },
    },
  }
})
