lvim.keys.normal_mode["<C-e>"] = ":lua require('harpoon.ui').toggle_quick_menu()<CR>"
lvim.keys.normal_mode["<C-h>"] = ":lua require('harpoon.ui').nav_file(1)<CR>"
lvim.keys.normal_mode["<C-t>"] = ":lua require('harpoon.ui').nav_file(2)<CR>"
lvim.keys.normal_mode["<C-n>"] = ":lua require('harpoon.ui').nav_file(3)<CR>"
lvim.keys.normal_mode["<C-s>"] = ":lua require('harpoon.ui').nav_file(4)<CR>"
lvim.keys.normal_mode["<C-j>"] = ":lprev<CR>"
lvim.keys.normal_mode["<C-k>"] = ":lnext<CR>"
lvim.keys.normal_mode["<C-f>"] =
	':lua require("harpoon.term").sendCommand(1, "tmux-sessionizer\\n"); require("harpoon.term").gotoTerminal(1)<CR>'
lvim.keys.term_mode["<Esc>"] = "<C-\\><C-n>"
lvim.builtin.which_key.mappings["e"] = { ':Ex<CR>', "Explorer" }
lvim.builtin.which_key.mappings["y"] = { '"+y', "Yank to clipboard" }
lvim.builtin.which_key.vmappings["y"] = { '"+y', "Yank to clipboard" }
lvim.builtin.which_key.mappings["d"] = { '"_d', "Delete" }
lvim.builtin.which_key.vmappings["d"] = { '"_d', "Delete" }
lvim.builtin.which_key.mappings["p"] = { '"+p', "Put from clipboard" }
lvim.builtin.which_key.vmappings["p"] = { '"+p', "Put from clipboard" }
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

-- lvim.builtin.which_key.mappings["F"] = {
-- 	name = "+Flutter",
-- 	c = { "<cmd>lua require('telescope').extensions.flutter.commands()<cr>", "View Flutter Commands" },
-- }
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
