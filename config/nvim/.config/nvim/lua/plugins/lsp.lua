-- LSP config
local lspconfig = require("lspconfig")

-- TODO: Read about the adicional capabilities from cmp_nvim_lsp and how this
-- is used by broadcasting it to the servers above.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

set_lsp_keymap = function()
  -- Add keymap when attach with pyright (only inside the current buffer)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
end

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      telemetry = { enable = false },
      workspace = { checkThirdParty = false },
    },
  }
})

lspconfig.pyright.setup {
  on_attach = set_lsp_keymap,
  capabilities = capabilities,
}

lspconfig.clangd.setup {
  capabilities = capabilities,
}

lspconfig.tsserver.setup {
  on_attach = set_lsp_keymap,
  capabilities = capabilities,
}

lspconfig.ocamllsp.setup {
  on_attach = set_lsp_keymap,
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  on_attach = set_lsp_keymap,
  capabilities = capabilities,
}
