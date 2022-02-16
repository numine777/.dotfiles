lvim.plugins = {
	{
		{"akinsho/flutter-tools.nvim", commit = "d9697b913a7e199e48b09403755774bed7063a90" },
		"ThePrimeagen/git-worktree.nvim",
		"tpope/vim-fugitive",
		"ThePrimeagen/harpoon",
		"mtth/scratch.vim",
		"Shatur/neovim-ayu",
		{ "npxbr/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } },
		{ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" },
		-- { "github/copilot.vim" },
	},
}

-- Harpoon settings
require("harpoon").setup({
	nav_first_in_list = true,
})

vim.g.scratch_persistence_file = CACHE_PATH .. "/.vim/scratch_file"
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("flutter")
