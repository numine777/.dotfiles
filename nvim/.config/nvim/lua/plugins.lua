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

	-- Impatient loading
	use("lewis6991/impatient.nvim")

	-- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
	use({ "neovim/nvim-lspconfig" })
	-- use({ "tami5/lspsaga.nvim" })
	use({ "williamboman/nvim-lsp-installer" })
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
	-- use({ "hrsh7th/nvim-compe" })
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("lv-cmp").setup()
		end,
		requires = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
		},
		run = function()
			-- cmp's config requires cmp to be installed to run the first time
			if not dvim.builtin.cmp then
				require("lv-cmp").config()
			end
		end,
	})
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	-- use({ "github/copilot.vim" })
	use({ "hrsh7th/vim-vsnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "andymass/vim-matchup" })

	-- LSP
	use({ "ambv/black" })
	use({ "akinsho/flutter-tools.nvim" })
	-- use({ "jose-elias-alvarez/null-ls.nvim",
	--     config = function()
	--         require("lsp.null-ls").config()
	--         require("lspconfig")["null-ls"].setup()
	--     end,
	--     requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
	-- })
	-- use {"mfussenegger/nvim-jdtls"}

	-- Explorer
	-- use({
	-- 	"kyazdani42/nvim-tree.lua",
	-- 	-- event = "BufEnter",
	-- 	-- cmd = "NvimTreeToggle",
	-- 	config = function()
	-- 		require("lv-nvimtree").setup()
	-- 	end,
	-- })

	-- use {'metakirby5/codi.vim'}

	-- Refactoring
	use({
		"ThePrimeagen/refactoring.nvim",
	})
	-- Git
	use({ "ThePrimeagen/git-worktree.nvim" })
	use({ "tpope/vim-fugitive" })
	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("lv-autopairs").setup()
		end,
	})
	use({ "kevinhwang91/nvim-bqf" })
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("lv-gitsigns").config()
		end,
		event = "BufRead",
	})

	-- use {'f-person/git-blame.nvim'}

	-- Comments
	use({ "terrortylor/nvim-comment" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	-- Color
	-- use({ "flazz/vim-colorschemes" })
	use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
	-- use {"christianchiarulli/nvcode-color-schemes.vim"}

	-- Icons
	use({ "kyazdani42/nvim-web-devicons" })

	-- Status Line and Bufferline
	use({ "hoob3rt/lualine.nvim" })

	-- Navigation
	use({ "ThePrimeagen/harpoon" })

	-- Scratch
	use({ "mtth/scratch.vim" })

	-- Dadbod
	use({ "tpope/vim-dadbod" })
end)
