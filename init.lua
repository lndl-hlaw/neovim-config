vim.o.number = true         -- Numbering lines
vim.o.relativenumber = true -- Numbering relative to current line
vim.o.signcolumn = "yes"
vim.o.wrap = false          -- Visual wrapping of long lines
vim.o.tabstop = 4           -- Length of `Tab` in spaces
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

vim.keymap.set({"n", "v"}, '<Tab>', ":bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set({"n", "v"}, '<S-Tab>', ":bprev<CR>", { silent = true, desc = "Prev buffer" })
vim.keymap.set({"n", "v"}, '<S-d>', ":bdelete<CR>", { silent = true, desc = "Delete buffer" })

-- I dont use this, since I use tabs
-- vim.keymap.set({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')  -- Switch to alternate file (recently opened)
-- vim.keymap.set({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>') -- The same as above, but instead of switching, it splits the screen horizontally


vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },		-- Colorscheme
	{ src = "https://github.com/rebelot/kanagawa.nvim" },	-- Colorscheme
	{ src = "https://github.com/folke/tokyonight.nvim" },	-- Colorscheme
	{ src = "https://github.com/catppuccin/nvim" },			-- Colorscheme
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },      -- Some async library for neovim lua.
	{ src = "https://github.com/MunifTanjim/nui.nvim" },       -- This is an UI tool for nvim, higly customizable, may be used by another exts.
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- This is a pack of icons for file explorers, trees, etc.
	{ src = "https://github.com/nvim-telescope/telescope.nvim",          version = "0.1.8" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/LinArcX/telescope-env.nvim" },  -- Displays current environmental variables with `:Telescope env` command
	{ src = "https://github.com/aznhe21/actions-preview.nvim" }, -- Preview on action on binding
	{ src = "https://github.com/numToStr/Comment.nvim" },       -- Commenting on 'gc'
	{ src = "https://github.com/nvimtools/none-ls.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
})

require "oil".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "python", "cpp", "rust", "haskell", "cuda", "lua" },
	highlight = { enable = true },
	sync_install = false,
	auto_install = false,
	ignore_install = {},
	modules = {}
})

require "bufferline".setup{}

require "null-ls".setup({
	require "custom.configs.null-ls"
})

require "nvim-autopairs".setup({
  event = "InsertEnter",
  config = true
})


local cmp = require "cmp"
cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  }),
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- confirm selection
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
})

require "bufferline".setup({
  options = {
	modified_icon = "●"
  },
})

vim.keymap.set('n', '<leader>e', ':Oil<CR>')

-- LSP configuration:

-- For now I dont use the below, since I have cmp
-- doing all the work, but leave it here.
--
-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client:supports_method('textDocument/completion') then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,
-- })
-- vim.cmd("set completeopt+=noselect")


-- LSP predefined bindings:
-- K								- LSP hover
-- Ctrl + w + d			- Diagnostic on hover

local lsps = { "lua_ls", "clangd", "pyright", "hls", "rust_analyzer", "glsl_analyzer", "cmp_nvim_lsp" }
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

vim.cmd("colorscheme kanagawa")
-- vim.cmd(":hi statusline guibg=NONE")


-- Telscope configuration
local previewers = require("telescope.previewers")
local telescope = require("telescope")
local commits_previewer = previewers.new_termopen_previewer({
  get_command = function(entry)
    local sha = entry.value

    return {
      "sh", "-c",
      table.concat({
        "echo '----------------------------------------------------'",
        "echo 'Commit:      " .. sha .. "'",
        "echo 'Author:      '$(git show -s --format=%an " .. sha .. ")",
        "echo 'Date:        '$(git show -s --format=%ad " .. sha .. ")",
        "echo 'Message:     '$(git show -s --format=%s " .. sha .. ")",
        "echo '----------------------------------------------------'",
        "echo",
        "git show --patch " .. sha
      }, " && ")
    }
  end,
})
telescope.setup({
	defaults = {
		preview = { treesitter = false },
		color_devicons = true,
		sorting_strategy = "ascending",
		borderchars = {
			"─", -- top
			"│", -- right
			"─", -- bottom
			"│", -- left
			"┌", -- top-left
			"┐", -- top-right
			"┘", -- bottom-right
			"└", -- bottom-left
		},
		path_displays = { "smart" },
		layout_config = {
			height = 100,
			width = 400,
			prompt_position = "top",
			preview_cutoff = 40,
		}
	},
    pickers = {
      git_bcommits = {
		previewer=commits_previewer
      },
      git_commits = {
		previewer=commits_previewer
      },
    },
})
telescope.load_extension("ui-select")

require("actions-preview").setup {
	backend = { "telescope" },
	extensions = { "env" },
	telescope = vim.tbl_extend(
		"force",
		require("telescope.themes").get_dropdown(), {}
	)
}

local builtin = require("telescope.builtin")

-- Telescope and actions-preview bindings:
vim.keymap.set({ "n" }, "<leader>f", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set({ "n" }, "<leader>g", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set({ "n" }, "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set({ "n" }, "<leader>si", builtin.grep_string, { desc = "Telescope live string" })
vim.keymap.set({ "n" }, "<leader>so", builtin.oldfiles, { desc = "Telescope buffers" })
vim.keymap.set({ "n" }, "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set({ "n" }, "<leader>sm", builtin.man_pages, { desc = "Telescope man pages" })
vim.keymap.set({ "n" }, "<leader>sr", builtin.lsp_references, { desc = "Telescope lsp_references" })
vim.keymap.set({ "n" }, "<leader>st", builtin.builtin, { desc = "Telescope builtin" })
vim.keymap.set({ "n" }, "<leader>sd", builtin.registers, { desc = "Telescope registers" })
vim.keymap.set({ "n" }, "<leader>sc", builtin.git_bcommits, { desc = "Telescope git_bcommits" })
vim.keymap.set({ "n" }, "<leader>sl", builtin.git_commits, { desc = "Telescope git_commits" })
vim.keymap.set({ "n" }, "<leader>se", "<cmd>Telescope env<cr>", { desc = "Telescope envs" })
vim.keymap.set({ "n" }, "<leader>sa", require("actions-preview").code_actions)
vim.keymap.set({ "n" }, 'gr', builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set({ "n" }, 'gd', builtin.lsp_definitions, { noremap = true, silent = true })
vim.keymap.set({ "n" }, 'gi', builtin.lsp_implementations, { noremap = true, silent = true })
vim.keymap.set({ "n" }, 'gt', builtin.lsp_type_definitions, { noremap = true, silent = true })

require "lualine".setup {
	options = {
		theme = 'everforest', -- pick your theme here
		section_separators = '',
		component_separators = '',
	},
	sections = {
		lualine_a = {
			{
				'buffers',
				show_filename_only = false
			}
		}
	}
}
