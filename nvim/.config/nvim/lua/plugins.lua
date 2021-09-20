local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	return
end

packer.init({
	git = { clone_timeout = 300 },
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require("packer").startup(function(use)
	-- Packer can manage itself as an optional plugin
	use("wbthomason/packer.nvim")

	-- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
	use({ "neovim/nvim-lspconfig" })
	use({ "glepnir/lspsaga.nvim" })
	use({ "kabouzeid/nvim-lspinstall" })
	use({ "folke/trouble.nvim" })
	use({ "sbdchd/neoformat" })
	use({ "simrat39/symbols-outline.nvim" })

	-- Telescope
	use({ "nvim-lua/popup.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("lv-telescope").config()
		end,
	})
	use({ "nvim-telescope/telescope-fzy-native.nvim" })

	-- Debugging
	use({ "mfussenegger/nvim-dap" })
	-- use({ "puremourning/vimspector" })
	-- use({ "szw/vim-maximizer" })
	-- use({ "Pocco81/DAPInstall.nvim"})

	-- Autocomplete
	use({ "hrsh7th/nvim-compe" })
	use({ "hrsh7th/vim-vsnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "andymass/vim-matchup" })

	-- LSP
	use({ "ambv/black" })
	use({ "akinsho/flutter-tools.nvim" })
	-- use {"mfussenegger/nvim-jdtls"}

	-- Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		-- event = "BufEnter",
		-- cmd = "NvimTreeToggle",
		config = function()
			require("lv-nvimtree").config()
		end,
	})

	-- use {'metakirby5/codi.vim'}

	-- Refactoring
	use({
		"ThePrimeagen/refactoring.nvim",
	})
	-- Git
	use({ "ThePrimeagen/git-worktree.nvim" })
	use({ "tpope/vim-fugitive" })
	use({ "windwp/nvim-autopairs" })
	use({ "kevinhwang91/nvim-bqf" })
	use({ "lewis6991/gitsigns.nvim" })
	-- use {'f-person/git-blame.nvim'}

	-- Comments
	use({ "terrortylor/nvim-comment" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	-- Color
	use({ "flazz/vim-colorschemes" })
	-- use {"christianchiarulli/nvcode-color-schemes.vim"}

	-- Icons
	use({ "kyazdani42/nvim-web-devicons" })

	-- Status Line and Bufferline
	use({ "hoob3rt/lualine.nvim" })

	-- Navigation
	use({ "airblade/vim-rooter" })
	use({ "ThePrimeagen/harpoon" })
end)
