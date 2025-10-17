local base = require("plugins.configs.lspconfig")
local on_attach_base = base.on_attach or function() end
local on_init = base.on_init
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

-- LSP for clangd
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    -- Call the original on_attach safely
    on_attach_base(client, bufnr)
  end,
  capabilities = capabilities,
}

-- LSP for Haskell
lspconfig.hls.setup {
  on_attach = on_attach_base,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { 'haskell', 'lhaskell', 'cabal'},
}

-- Python LSP
local python_servers = { "pyright" }

for _, lsp in ipairs(python_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach_base,
    capabilities = capabilities,
    filetypes = { "python" },
  }
end
