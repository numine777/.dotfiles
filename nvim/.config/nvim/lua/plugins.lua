local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
	local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

	local plugin_path = plugin_prefix .. plugin .. "/"
	--	print('test '..plugin_path)
	local ok, err, code = os.rename(plugin_path, plugin_path)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	--	print(ok, err, code)
	if ok then
		vim.cmd("packadd " .. plugin)
	end
	return ok, err, code
end

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
	-- Packer can manage itself as an optional plugin
	use("wbthomason/packer.nvim")

	-- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
	use({ "neovim/nvim-lspconfig", opt = true })
	use({ "glepnir/lspsaga.nvim", opt = true })
	use({ "kabouzeid/nvim-lspinstall", opt = true })
	use({ "folke/trouble.nvim", opt = true })
	use({ "sbdchd/neoformat", opt = true })
	use({ "simrat39/symbols-outline.nvim", opt = true })

	-- Telescope
	use({ "nvim-lua/popup.nvim", opt = true })
	use({ "nvim-lua/plenary.nvim", opt = true })
	use({ "nvim-telescope/telescope.nvim", opt = true })
	use({ "nvim-telescope/telescope-fzy-native.nvim", opt = true })

	-- Debugging
	use({ "puremourning/vimspector", opt = true })
	use({ "szw/vim-maximizer", opt = true })
	-- use {"mfussenegger/nvim-dap", opt = true}

	-- Autocomplete
	use({ "hrsh7th/nvim-compe", opt = true })
	use({ "hrsh7th/vim-vsnip", opt = true })
	use({ "rafamadriz/friendly-snippets", opt = true })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "windwp/nvim-ts-autotag", opt = true })
	use({ "andymass/vim-matchup", opt = true })

	-- LSP
	use({ "ambv/black", opt = true })
	use({ "akinsho/flutter-tools.nvim", opt = true })
	-- use {"mfussenegger/nvim-jdtls", opt = true}

	-- Explorer
	-- use {"kyazdani42/nvim-tree.lua", opt = true}

	-- use {'metakirby5/codi.vim', opt = true}

	-- Refactoring
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
			opt = true,
		},
	})
	-- Git
	use({ "ThePrimeagen/git-worktree.nvim", opt = true })
	use({ "tpope/vim-fugitive", opt = true })
	use({ "windwp/nvim-autopairs", opt = true })
	use({ "kevinhwang91/nvim-bqf", opt = true })
	-- use {"lewis6991/gitsigns.nvim", opt = true}
	-- use {'f-person/git-blame.nvim', opt = true}

	-- Comments
	use({ "terrortylor/nvim-comment", opt = true })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", opt = true })

	-- Color
	-- use {"gruvbox-community/gruvbox", opt = true}
	use({ "flazz/vim-colorschemes", opt = true })
	use({ "rktjmp/lush.nvim", opt = true })
	use({ "npxbr/gruvbox.nvim", opt = true })
	-- use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}

	-- Icons
	use({ "kyazdani42/nvim-web-devicons", opt = true })

	-- Status Line and Bufferline
	use({ "hoob3rt/lualine.nvim", opt = true })
	use({ "ThePrimeagen/harpoon", opt = true })

	require_plugin("nvim-lspconfig")
	require_plugin("lspsaga.nvim")
	require_plugin("nvim-lspinstall")
	require_plugin("trouble.nvim")
	require_plugin("friendly-snippets")
	require_plugin("popup.nvim")
	require_plugin("plenary.nvim")
	require_plugin("telescope.nvim")
	require_plugin("telescope-project.nvim")
	require_plugin("nvim-compe")
	require_plugin("vim-vsnip")
	require_plugin("nvim-treesitter")
	require_plugin("nvim-autopairs")
	require_plugin("nvim-comment")
	require_plugin("nvim-bqf")
	require_plugin("nvim-web-devicons")
	require_plugin("harpoon")
	require_plugin("nvim-ts-context-commentstring")
	require_plugin("vim-fugitive")
	require_plugin("git-worktree.nvim")
	require_plugin("vimspector")
	require_plugin("vim-maximizer")
	require_plugin("black")
	require_plugin("flutter-tools.nvim")
	require_plugin("vim-colorschemes")
	require_plugin("neoformat")
	require_plugin("lualine.nvim")
	require_plugin("nvim-ts-autotag")
	require_plugin("vim-matchup")
	require_plugin("symbols-outline.nvim")
	require_plugin("refactoring.nvim")
	-- require_plugin("nvim-dap")
	-- require_plugin("nvim-tree.lua")
	-- require_plugin("gitsigns.nvim")
	-- require_plugin("git-blame.nvim")
	-- require_plugin("nvcode-color-schemes.vim")
	-- require_plugin("nvim-jdtls")
	-- require_plugin('codi.vim')
end)
