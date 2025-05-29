local plugins = {
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  },
  { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
  {
    "exosyphon/telescope-color-picker.nvim",
    config = function()
      vim.keymap.set("n", "<leader>uC", "<cmd>Telescope colors<CR>", { desc = "Telescope Color Picker" })
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "debugloop/telescope-undo.nvim",
  },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  {
    "nvim-lua/plenary.nvim",
    lazy=true
  },
  {
    "nvim-neotest/nvim-nio"
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        return require "custom.configs.null-ls"
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "haskell-language-server",
        "pyright",
        "mypy",
        "ruff",
        "black",
        "debugpy",
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "haskell"
      },
    },
  },
  {
    "rafamadriz/friendly-snippets"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_lua").load({
            paths = "./lua/snippets" -- here define a path to directory with custom snippets
          })
        end,
      },
    },
  },
  {
    'echasnovski/mini.nvim',
    version = false, -- or pin a version if you want
    event = 'VimEnter',
    config = function()
      -- Full config: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-base16.md
      require("mini.ai").setup()
      require("mini.align").setup()
      require("mini.move").setup()
      require("mini.basics").setup()
      require("mini.extra").setup()
      require("mini.files").setup()
      require("mini.git").setup()
      require("mini.animate").setup()
      require("mini.colors").setup()
      require("mini.notify").setup()
      require("mini.statusline").setup()
      require("mini.test").setup()
      require("mini.base16").setup({
        palette = {
          base00 = '#112641',
          base01 = '#3a475e',
          base02 = '#606b81',
          base03 = '#8691a7',
          base04 = '#d5dc81',
          base05 = '#e2e98f',
          base06 = '#eff69c',
          base07 = '#fcffaa',
          base08 = '#ffcfa0',
          base09 = '#cc7e46',
          base0A = '#46a436',
          base0B = '#9ff895',
          base0C = '#ca6ecf',
          base0D = '#42f7ff',
          base0E = '#ffc4ff',
          base0F = '#00a5c5',
        },
        use_cterm = true,
        plugins = {
          default = false,
          ['echasnovski/mini.nvim'] = true,
        },
      })
    end
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim'  }, -- if you use the mini.nvim suite
    ft = "markdown",
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    -- Here the source
    -- of the following `opt`: https://github.com/linkarzu/dotfiles-latest/blob/main/neovim/neobean/lua/plugins/render-markdown.lua
    opts = {
      bullet = {
        -- Turn on / off list bullet rendering
        enabled = true,
      },
      checkbox = {
        -- Turn on / off checkbox state rendering
        enabled = true,
        -- Determines how icons fill the available space:
        --  inline:  underlying text is concealed resulting in a left aligned icon
        --  overlay: result is left padded with spaces to hide any additional text
        position = "inline",
        unchecked = {
          -- Replaces '[ ]' of 'task_list_marker_unchecked'
          icon = "   󰄱 ",
          -- Highlight for the unchecked icon
          highlight = "RenderMarkdownUnchecked",
          -- Highlight for item associated with unchecked checkbox
          scope_highlight = nil,
        },
        checked = {
          -- Replaces '[x]' of 'task_list_marker_checked'
          icon = "   󰱒 ",
          -- Highlight for the checked icon
          highlight = "RenderMarkdownChecked",
          -- Highlight for item associated with checked checkbox
          scope_highlight = nil,
        },
      },
      html = {
        -- Turn on / off all HTML rendering
        enabled = true,
        comment = {
          -- Turn on / off HTML comment concealing
          conceal = false,
        },
      },
      -- Add custom icons lamw26wmal
      link = {
        image = vim.g.neovim_mode == "skitty" and "" or "󰥶 ",
        custom = {
          youtu = { pattern = "youtu%.be", icon = "󰗃 " },
        },
      },
      heading = {
        sign = false,
        icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
        backgrounds = {
          "Headline1Bg",
          "Headline2Bg",
          "Headline3Bg",
          "Headline4Bg",
          "Headline5Bg",
          "Headline6Bg",
        },
        foregrounds = {
          "Headline1Fg",
          "Headline2Fg",
          "Headline3Fg",
          "Headline4Fg",
          "Headline5Fg",
          "Headline6Fg",
        },
      },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    event = 'VimEnter',
    -- Full setup available here:
    -- https://github.com/akinsho/toggleterm.nvim?tab=readme-ov-file#setup

    config = function ()
      require("toggleterm").setup {
        size = 15 or function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        auto_scroll = true,
        direction = 'float',
        start_in_insert = true,
        terminal_mappings = true,
        insert_mappings = true,
        float_opts = {
          border = 'curved',
          winblend = 3
        },
      }
    end
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
              week_header = {
               enable = true,
              },
              shortcut = {
                { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                {
                  icon = ' ',
                  icon_hl = '@variable',
                  desc = 'Files',
                  group = 'Label',
                  action = 'Telescope find_files',
                  key = 'f',
                },
                {
                  desc = ' Apps',
                  group = 'DiagnosticHint',
                  action = 'Telescope app',
                  key = 'a',
                },
                {
                  desc = ' dotfiles',
                  group = 'Number',
                  action = 'Telescope dotfiles',
                  key = 'd',
                },
              },
            },
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    "github/copilot.vim",
    event = "InsertEnter",
  }
}
return plugins
