require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]


-- The venv must be created
-- like that -- python3 -m venv ~/.venvs/nvim
-- To verify if it is configured properly in neovim
-- run this -- :echo g:python3_host_prog
vim.g.python3_host_prog = vim.fn.expand("~/.venvs/nvim/bin/python")

-- vim.lsp.inlay_hint.enable(true) -- this may be commented in some cases
vim.lsp.inlay_hint.enable(true)

vim.opt.number = true         -- Show absolute number on the current line
vim.opt.relativenumber = true -- Show relative numbers on other lines

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

