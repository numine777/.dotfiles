--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
O.format_on_save = true
O.auto_complete = true
O.colorscheme = "spacegray"
O.auto_close_tree = 1
O.wrap_lines = false
O.timeoutlen = 100
O.leader_key = " "
O.ignore_case = false
O.smart_case = true

-- TODO User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
O.plugin.dashboard.active = true
O.plugin.colorizer.active = true
O.plugin.debug.active = true
O.plugin.dap_install.active = true
O.plugin.floatterm.active = true
O.plugin.ts_playground.active = false
O.plugin.indent_line.active = true
O.plugin.zen.active = true

-- dashboard
-- O.dashboard.custom_header = {""}
-- O.dashboard.footer = {""}

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "all"
O.treesitter.ignore_install = { "haskell" }
O.treesitter.highlight.enabled = true

-- python
O.lang.python.formatter = 'black'
O.lang.python.linter = 'pylint'
O.lang.python.isort = true
O.lang.python.diagnostics.virtual_text = true
O.lang.python.analysis.use_library_code_types = true

-- javascript
O.lang.tsserver.formatter = 'prettier'
O.lang.tsserver.linter = 'eslint'

-- lua
O.lang.lua.autoformat = true

-- dart
-- O.lang.dart.sdk_path = '/Users/scott/bin/flutter/bin/dart'
-- Additional Plugins
-- O.user_plugins = {{"windwp/nvim-ts-autotag"}}
O.user_plugins = {{
  "akinsho/flutter-tools.nvim",
  "ThePrimeagen/git-worktree.nvim",
  "tpope/vim-fugitive",
  "ThePrimeagen/harpoon"
}}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- O.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Leader bindings for WhichKey
-- O.user_which_key = {
--   A = {
--     name = "+Custom Leader Keys",
--     a = { "<cmd>echo 'first custom command'<cr>", "Description for a" },
--     b = { "<cmd>echo 'second custom command'<cr>", "Description for b" },
--   },
--}
O.user_which_key = {
  G = {
    name = "+Custom Git Keys",
    w = {"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "View Git Worktrees"},
    W = {"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "New Git Worktree"},
  },
  H = {
    name = "+Harpoon",
    a = {"<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File"},
    u = {"<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "Go to Terminal 1"},
    e = {"<cmd>lua require('harpoon.term').gotoTerminal(2)<cr>", "Go to Terminal 2"},
    o = {"<cmd>lua require('harpoon.term').sendCommand(1, 1)<cr>", "Send Command 1"},
    i = {"<cmd>lua require('harpoon.term').sendCommand(1, 2)<cr>", "Send Command 2"},
  },
  F = {
    name = "+Flutter",
    c = {"<cmd>lua require('telescope').extensions.flutter.commands()<cr>", "View Flutter Commands"},
  }
}

require("flutter-tools").setup{
  -- debugger = { -- integrate with nvim dap + install dart code debugger
  --   enabled = true,
  -- },  
  -- dev_tools = { auto_open_browser = true },
}
-- Harpoon settings
require'harpoon'.setup {
    nav_first_in_list = true,
}

vim.cmd([[
  nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
  
  nnoremap <C-o> :lua require("harpoon.ui").nav_file(1)<CR>
  nnoremap <C-u> :lua require("harpoon.ui").nav_file(2)<CR>
  nnoremap <C-t> :lua require("harpoon.ui").nav_file(3)<CR>
  nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>
]])
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("flutter")

-- Debuggers

-- Dart
-- local dap = require "dap"
--   dap.adapters.dart = {
--     type = "executable",
--     command = "node",
--     args = {"/Users/scott/bin/debuggers/Dart-Code/out/dist/debug.js", "flutter"}
--   }
--   dap.configurations.dart = {
--     {
--       type = "dart",
--       request = "launch",
--       name = "Launch flutter",
--       dartSdkPath = os.getenv('HOME').."/flutter/bin/cache/dart-sdk/",
--       flutterSdkPath = os.getenv('HOME').."/flutter",
--       program = "${workspaceFolder}/lib/main.dart",
--       cwd = "${workspaceFolder}",
--     }
--   }
-- 
