-- Null LS configuration

local null_ls = require("null-ls")
local sources = {
    null_ls.builtins.formatting.yapf,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8,
}

null_ls.setup({
    sources = sources,
})
