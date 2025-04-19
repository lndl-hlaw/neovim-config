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
      require('mini.starter').setup()
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
  }
}
return plugins
