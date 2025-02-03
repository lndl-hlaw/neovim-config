local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
    ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },
    ["<C-u>"] = { "<cmd> bprevious <CR>", "Switch to previous buffer" },
    ["<S-Up>"] = { "<cmd> m-2 <CR>", "Moves one line up" },
    ["<S-Down>"] = { "<cmd> m+ <CR>", "Moves one line down" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fw"] = { "<cmd> Telescope grep_string <CR>", "Find word under cursor" },
  }
}

return M
