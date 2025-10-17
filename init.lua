vim.o.number = true         -- Numbering lines
vim.o.relativenumber = true -- Numbering relative to current line
vim.o.signcolumn = "yes"
vim.o.wrap = false          -- Visual wrapping of long lines
vim.o.tabstop = 2           -- Length of `Tab` in spaces
vim.o.shiftwidth = 2
vim.o.cursorcolumn = false
vim.o.ignorecase = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.incsearch = true
vim.o.swapfile = false      -- If neovim should create a swapfile
vim.g.mapleader = " "       -- Mapping a leader
vim.o.winborder = "rounded" -- Borders of windows like in LSP hover, see also "double" value

-- SYNTAX: vim.keymap.set('mode', 'shortcut', 'command')
vim.keymap.set('n', '<leader>o', ":update<CR> :source<CR>") -- Save (if not saved) and update the file
vim.keymap.set('n', '<leader>w', ":write<CR>")              -- Write the file
vim.keymap.set('n', '<leader>q', ":q<CR>")                  -- Quit the file

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')	-- Switch to alternate file (recently opened)
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>') -- The same as above, but instead of switching, it splits the screen horizontally

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },      -- Some async library for neovim lua.
	{ src = "https://github.com/MunifTanjim/nui.nvim" },       -- This is an UI tool for nvim, higly customizable, may be used by another exts.
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- This is a pack of icons for file explorers, trees, etc.
})

require "mini.pick".setup()
require "oil".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "python", "cpp", "rust", "haskell", "cuda", "lua" },
	highlight = { enable = true },
	sync_install = false,
	auto_install = false,
	ignore_install = {},
	modules = {}
})

vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

-- LSP configuration:
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

-- LSP predefined bindings:
-- K								- LSP hover
-- Ctrl + w + d			- Diagnostic on hover

local lsps = { "lua_ls", "clangd", "pyright", "hls" }
vim.lsp.enable(lsps)
for _, lsp in ipairs(lsps) do
	vim.lsp.config(lsp, {
		settings = {
			Lua = {
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				}
			}
		}
	})
end
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
