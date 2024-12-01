-- LSP config
local lspconfig = require("lspconfig")

-- TODO: Read about the adicional capabilities from cmp_nvim_lsp and how this
-- is used by broadcasting it to the servers above.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local set_lsp_keymap = function()
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
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  cmd = {
    "clangd",
    "--clang-tidy",                -- enable clang-tidy diagnostics
    "--background-index",          -- index project code in the background and persist index on disk
    "--completion-style=detailed", -- granularity of code completion suggestions: bundled, detailed
  },
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

lspconfig.emmet_language_server.setup {
  on_attach = set_lsp_keymap,
  capabilities = capabilities,
}

lspconfig.jsonls.setup {
  on_attach = set_lsp_keymap,
  capabilities = capabilities,
}

lspconfig.terraformls.setup {
  on_attach = set_lsp_keymap,
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
  on_attach = set_lsp_keymap,
  capabilities = capabilities,
}
