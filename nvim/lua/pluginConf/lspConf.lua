--mason
require("mason").setup()

--bridge
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd" }
})

--lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
  capabilities = capabilities
})
lspconfig.clangd.setup({
  capabilities = capabilities
})

--nonels
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.clang_format,
  },
})
