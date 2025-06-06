local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
    ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },
    ["<S-Up>"] = { "<cmd> m-2 <CR>", "Moves one line up" },
    ["<S-Down>"] = { "<cmd> m+ <CR>", "Moves one line down" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fw"] = { "<cmd> Telescope grep_string <CR>", "Find word under cursor" },
    ["<C-b>"] = {"<cmd> lua MiniFiles.open() <CR>", "Open mini.files buffer"},
    ["<leader>ai"] = {"<cmd> CopilotChatOpen <CR>", "Open Copilot chat"},
    ["<M-t>"] = { "<cmd> CopilotChatToggle <CR>", "Toggle Copilot chat window" },
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

return M
