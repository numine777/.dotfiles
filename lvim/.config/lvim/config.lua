CACHE_PATH = vim.fn.stdpath("cache")

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
lvim.transparent_window = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamed"

lvim.leader = "space"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.terminal.open_mapping = [[<c-\>]]
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

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

-- local root_files = {
-- 	"setup.py",
-- 	"pyproject.toml",
-- 	"setup.cfg",
-- 	"requirements.txt",
-- 	".git",
-- 	"BUILD.bazel",
-- 	"package.json",
-- 	"pubspec.yaml",
-- }

-- lvim.lsp.null_ls.setup = {
-- 	root_dir = require("lspconfig").util.root_pattern(root_files),
-- }

lvim.format_on_save = false
lvim.lang.python.formatters = { { exe = "black" } }
lvim.lang.python.linters = { { exe = "flake8" } }

lvim.lang.lua.formatters = { { exe = "stylua" } }

lvim.lang.typescript.formatters = { { exe = "prettier" } }
lvim.lang.typescript.linters = { { exe = "eslint" } }

lvim.plugins = {
	{
		"akinsho/flutter-tools.nvim",
		"ThePrimeagen/git-worktree.nvim",
		"tpope/vim-fugitive",
		"ThePrimeagen/harpoon",
		"mtth/scratch.vim",
		"Shatur/neovim-ayu",
		{ "npxbr/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } },
	},
}

-- Additional Leader bindings for WhichKey

local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
dart_capabilities.textDocument.codeAction = {
	dynamicRegistration = false,
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
			},
		},
	},
}

require("flutter-tools").setup({
	ui = {
		-- the border type to use for all floating windows, the same options/formats
		-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
		border = "rounded",
	},
	decorations = {
		statusline = {
			-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
			-- this will show the current version of the flutter app from the pubspec.yaml file
			app_version = true,
			-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
			-- this will show the currently running device if an application was started with a specific
			-- device
			device = true,
		},
	},
	widget_guides = {
		enabled = true,
	},
	closing_tags = {
		highlight = "ErrorMsg", -- highlight for the closing tag
		prefix = ">", -- character to use for close tag e.g. > Widget
		enabled = true, -- set to false to disable
	},
	dev_log = {
		open_cmd = "tabedit", -- command to use to open the log buffer
	},
	debugger = { -- integrate with nvim dap + install dart code debugger
		enabled = true,
	},
	dev_tools = {
		autostart = false, -- autostart devtools server if not detected
		auto_open_browser = false, -- Automatically opens devtools in the browser
	},
	outline = {
		open_cmd = "30vnew", -- command to use to open the outline buffer
		auto_open = false, -- if true this will open the outline automatically when it is first populated
	},
	lsp = {
		capabilities = dart_capabilities, -- e.g. lsp_status capabilities
		--- OR you can specify a function to deactivate or change or control how the config is created
		settings = {
			showTodos = true,
			completeFunctionCalls = true,
			-- analysisExcludedFolders = {<path-to-flutter-sdk-packages>}
		},
	},
})

-- Harpoon settings
require("harpoon").setup({
	nav_first_in_list = true,
})

vim.g.scratch_persistence_file = CACHE_PATH .. "/.vim/scratch_file"
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("flutter")

lvim.keys.normal_mode["<C-e>"] = ":lua require('harpoon.ui').toggle_quick_menu()<CR>"
lvim.keys.normal_mode["<C-h>"] = ":lua require('harpoon.ui').nav_file(1)<CR>"
lvim.keys.normal_mode["<C-t>"] = ":lua require('harpoon.ui').nav_file(2)<CR>"
lvim.keys.normal_mode["<C-n>"] = ":lua require('harpoon.ui').nav_file(3)<CR>"
lvim.keys.normal_mode["<C-s>"] = ":lua require('harpoon.ui').nav_file(4)<CR>"
lvim.keys.normal_mode["<C-j>"] = ":lprev<CR>"
lvim.keys.normal_mode["<C-k>"] = ":lnext<CR>"
lvim.keys.term_mode["<Esc>"] = "<C-\\><C-n>"
lvim.builtin.which_key.mappings["y"] = { '"+y', "Yank to clipboard" }
lvim.builtin.which_key.mappings["p"] = { '"+p', "Put from clipboard" }
lvim.builtin.which_key.mappings["h"] = { ":wincmd h<cr>", "Window left" }
lvim.builtin.which_key.mappings["j"] = { ":wincmd j<cr>", "Window down" }
lvim.builtin.which_key.mappings["k"] = { ":wincmd k<cr>", "Window up" }
lvim.builtin.which_key.mappings["l"] = { ":wincmd l<cr>", "Window right" }
lvim.builtin.which_key.mappings["J"] = { ":cprev<CR>", "Globalist Prev" }
lvim.builtin.which_key.mappings["K"] = { ":cnext<CR>", "Globalist Next" }
lvim.builtin.which_key.mappings["a"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon Add File" }
lvim.builtin.which_key.mappings["S"] = { ":Scratch<CR>", "Scratch" }
lvim.builtin.which_key.mappings["g"]["g"] = { ":G<cr>", "Fugitive" }
lvim.builtin.which_key.mappings["g"]["w"] = {
	"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
	"View Git Worktrees",
}
lvim.builtin.which_key.mappings["g"]["m"] = {
	"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
	"New Git Worktree",
}
lvim.builtin.which_key.mappings["t"] = {
	name = "+Harpoon",
	u = { "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "Go to Terminal 1" },
	e = { "<cmd>lua require('harpoon.term').gotoTerminal(2)<cr>", "Go to Terminal 2" },
	-- o = {"<cmd>lua require('harpoon.term').sendCommand(1, 1)<cr>", "Send Command 1"},
	-- i = {"<cmd>lua require('harpoon.term').sendCommand(1, 2)<cr>", "Send Command 2"},
}

lvim.builtin.which_key.mappings["F"] = {
	name = "+Flutter",
	c = { "<cmd>lua require('telescope').extensions.flutter.commands()<cr>", "View Flutter Commands" },
}
lvim.builtin.which_key.mappings["P"] = {
	name = "Packer",
	c = { "<cmd>PackerCompile<cr>", "Compile" },
	i = { "<cmd>PackerInstall<cr>", "Install" },
	r = { "<cmd>lua require('utils').reload_lv_config()<cr>", "Reload" },
	s = { "<cmd>PackerSync<cr>", "Sync" },
	S = { "<cmd>PackerStatus<cr>", "Status" },
	u = { "<cmd>PackerUpdate<cr>", "Update" },
}
lvim.builtin.which_key.mappings["v"] = {
	name = "LSP",
    a = { "<cmd>lua require('lvim.core.telescope').code_actions()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    p = {
      name = "Peek",
      d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
      t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
      i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
    },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
}

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

-- local util = require("lspconfig/util")
-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- 	local function buf_set_option(...)
-- 		vim.api.nvim_buf_set_option(bufnr, ...)
-- 	end
-- 	local root_pattern = function()
-- 		return util.root_pattern(root_files)
-- 	end
-- 	buf_set_option("setup.root_dir", root_pattern())
-- end
--
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
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
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
