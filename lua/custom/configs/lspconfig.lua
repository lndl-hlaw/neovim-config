local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local on_init = base.on_init
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

-- LSP for c++ clangd
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- LSP for haskell
lspconfig.hls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { 'haskell', 'lhaskell', 'cabal'},
}

-- LSP for python
local python_servers = {
  "pyright",
  --"ruff_lsp",
}

for _, lsp in ipairs(python_servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
  })
end
