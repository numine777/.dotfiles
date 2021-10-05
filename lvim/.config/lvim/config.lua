--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
vim.opt.relativenumber = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"css",
	"rust",
	"java",
	"yaml",
}

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
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
lvim.plugins = {
	{
		"akinsho/flutter-tools.nvim",
		"ThePrimeagen/git-worktree.nvim",
		"tpope/vim-fugitive",
		"ThePrimeagen/harpoon",
		{ "npxbr/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } },
	},
}
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Additional Leader bindings for WhichKey
lvim.builtin.which_key.mappings["G"] = {
	name = "+Custom Git Keys",
	w = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "View Git Worktrees" },
	W = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "New Git Worktree" },
}

lvim.builtin.which_key.mappings["H"] = {
	name = "+Harpoon",
	a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
	u = { "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "Go to Terminal 1" },
	e = { "<cmd>lua require('harpoon.term').gotoTerminal(2)<cr>", "Go to Terminal 2" },
	-- o = {"<cmd>lua require('harpoon.term').sendCommand(1, 1)<cr>", "Send Command 1"},
	-- i = {"<cmd>lua require('harpoon.term').sendCommand(1, 2)<cr>", "Send Command 2"},
}

lvim.builtin.which_key.mappings["F"] = {
	name = "+Flutter",
	c = { "<cmd>lua require('telescope').extensions.flutter.commands()<cr>", "View Flutter Commands" },
}

require("flutter-tools").setup({})
-- Harpoon settings
require("harpoon").setup({
	nav_first_in_list = true,
})

vim.cmd([[
  nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
  
  nnoremap <C-f> :lua require("harpoon.ui").nav_file(1)<CR>
  nnoremap <C-g> :lua require("harpoon.ui").nav_file(2)<CR>
  nnoremap <C-c> :lua require("harpoon.ui").nav_file(3)<CR>
  nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>
]])
vim.cmd("tnoremap <Esc> <C-\\><C-n>")
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("flutter")

-- local root_files = {
--     'setup.py',
--     'pyproject.toml',
--     'setup.cfg',
--     'requirements.txt',
--     '.git',
--     'BUILD.bazel',
-- }
-- local util = require 'lspconfig/util'
-- lvim.lang.python.lsp.setup.root_dir = function(filename)
--       return util.root_pattern(unpack(root_files))(filename) or
--               util.path.dirname(filename)
--       end

lvim.lang.python.formatters = { { exe = "black" } }
lvim.lang.python.linters = { { exe = "pylint" } }
-- lvim.lang.python.lsp.on_attach=nil

lvim.lang.lua.formatters = { { exe = "stylua" } }

lvim.lang.typescript.formatters = { { exe = "prettier" } }
lvim.lang.typescript.linters = { { exe = "eslint" } }

-- local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
-- dart_capabilities.textDocument.codeAction = {
--   dynamicRegistration = false;
--       codeActionLiteralSupport = {
--           codeActionKind = {
--               valueSet = {
--                  "",
--                  "quickfix",
--                  "refactor",
--                  "refactor.extract",
--                  "refactor.inline",
--                  "refactor.rewrite",
--                  "source",
--                  "source.organizeImports",
--               };
--           };
--       };
-- }

-- lvim.lang.dart.lsp.setup.capabilities = dart_capabilities
-- lvim.lang.dart.lsp.setup.cmd = { "dart", "/Users/scott/bin/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" }
-- lvim.lang.dart.linters = {"dart", "/Users/scott/bin/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot"}
