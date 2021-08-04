-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "gruvbox"
vim.opt.relativenumber = true

-- keymappings
lvim.leader = "space"
-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
-- lvim.keys.normal_mode = {
--   Page down/up
--   {'[d', '<PageUp>'},
--   {']d', '<PageDown>'},
--
--   Navigate buffers
--   {'<Tab>', ':bnext<CR>'},
--   {'<S-Tab>', ':bprevious<CR>'},
-- }
-- if you just want to augment the existing ones then use the utility function
-- require("utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })
-- you can also use the native vim way directly
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

lvim.plugins = {{
  "akinsho/flutter-tools.nvim",
  "ThePrimeagen/git-worktree.nvim",
  "tpope/vim-fugitive",
  "ThePrimeagen/harpoon",
  {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}},
}}
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Additional Leader bindings for WhichKey
lvim.builtin.which_key.mappings["G"] = {
    name = "+Custom Git Keys",
    w = {"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "View Git Worktrees"},
    W = {"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "New Git Worktree"},
}

lvim.builtin.which_key.mappings["H"] = {
    name = "+Harpoon",
    a = {"<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File"},
    -- u = {"<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "Go to Terminal 1"},
    -- e = {"<cmd>lua require('harpoon.term').gotoTerminal(2)<cr>", "Go to Terminal 2"},
    -- o = {"<cmd>lua require('harpoon.term').sendCommand(1, 1)<cr>", "Send Command 1"},
    -- i = {"<cmd>lua require('harpoon.term').sendCommand(1, 2)<cr>", "Send Command 2"},
}

lvim.builtin.which_key.mappings["F"] = {
    name = "+Flutter",
    c = {"<cmd>lua require('telescope').extensions.flutter.commands()<cr>", "View Flutter Commands"},
}

require("flutter-tools").setup{}
-- Harpoon settings
require'harpoon'.setup {
    nav_first_in_list = true,
}

vim.cmd([[
  nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
  
  nnoremap <C-f> :lua require("harpoon.ui").nav_file(1)<CR>
  nnoremap <C-g> :lua require("harpoon.ui").nav_file(2)<CR>
  nnoremap <C-c> :lua require("harpoon.ui").nav_file(3)<CR>
  nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>
]])
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("flutter")

local root_files = {
    'setup.py',
    'pyproject.toml',
    'setup.cfg',
    'requirements.txt',
    '.git',
    'BUILD.bazel',
}
local util = require 'lspconfig/util'
lvim.lang.python.lsp.setup.root_dir = function(filename)
      return util.root_pattern(unpack(root_files))(filename) or
              util.path.dirname(filename)
      end

lvim.lang.python.formatter = "black"
lvim.lang.python.linters = "pylint"
lvim.lang.python.lsp.on_attach=nil

lvim.lang.lua.formatter = "stylua"

lvim.lang.typescript.formatter = "prettier"
lvim.lang.typescript.linters = "eslint"

local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
dart_capabilities.textDocument.codeAction = {
  dynamicRegistration = false;
      codeActionLiteralSupport = {
          codeActionKind = {
              valueSet = {
                 "",
                 "quickfix",
                 "refactor",
                 "refactor.extract",
                 "refactor.inline",
                 "refactor.rewrite",
                 "source",
                 "source.organizeImports",
              };
          };
      };
}

lvim.lang.dart.lsp.setup.capabilities = dart_capabilities
lvim.lang.dart.lsp.setup.cmd = { "dart", "/Users/scott/bin/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" }
lvim.lang.dart.linters = {"dart", "/Users/scott/bin/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot"}
