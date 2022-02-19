CACHE_PATH = vim.fn.stdpath("cache")

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
lvim.transparent_window = true
-- lvim.builtin.nvimtree.setup.nvim_tree_ignore = {}
-- lvim.builtin.nvimtree.setup.nvim_tree_hide_dotfiles = 0
lvim.builtin.lualine.options.theme = "gruvbox"
-- lvim.builtin.nvimtree.setup.update_cwd = false
-- lvim.builtin.nvimtree.setup.hijack_netrw = false
-- lvim.builtin.nvimtree.setup.disable_netrw = false
-- lvim.builtin.nvimtree.setup.update_to_buf_dir = {enabled = false, auto_open = false}
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamed"
vim.opt.timeoutlen = 200
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.mouse = ""
vim.opt.showtabline = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_localrmdir = "rm -rf"

lvim.leader = "space"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.bufferline.active = false
lvim.builtin.project.active = false
lvim.builtin.nvimtree.active = false
lvim.builtin.terminal.open_mapping = [[<c-\>]]
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"cpp",
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

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		exe = "prettier",
		args = { "--tab-width", "4" },
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
	},
	{ exe = "stylua", filetypes = { "lua" } },
	-- { exe = "clang-format", filetypes = { "cpp" } },
})

lvim.format_on_save = false
