local M = {}

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
	insert_mode = generic_opts_any,
	normal_mode = generic_opts_any,
	visual_mode = generic_opts_any,
	visual_block_mode = generic_opts_any,
	command_mode = generic_opts_any,
	term_mode = { silent = true },
}

local mode_adapters = {
	insert_mode = "i",
	normal_mode = "n",
	term_mode = "t",
	visual_mode = "v",
	visual_block_mode = "x",
	command_mode = "c",
}

-- Append key mappings to lunarvim's defaults for a given mode
-- @param keymaps The table of key mappings containing a list per mode (normal_mode, insert_mode, ..)
function M.append_to_defaults(keymaps)
	for mode, mappings in pairs(keymaps) do
		for k, v in ipairs(mappings) do
			dvim.keys[mode][k] = v
		end
	end
end

-- Set key mappings individually
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param key The key of keymap
-- @param val Can be form as a mapping or tuple of mapping and user defined opt
function M.set_keymaps(mode, key, val)
	local opt = generic_opts[mode] and generic_opts[mode] or generic_opts_any
	if type(val) == "table" then
		opt = val[2]
		val = val[1]
	end
	vim.api.nvim_set_keymap(mode, key, val, opt)
end

-- Load key mappings for a given mode
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param keymaps The list of key mappings
function M.load_mode(mode, keymaps)
	mode = mode_adapters[mode] and mode_adapters[mode] or mode
	for k, v in pairs(keymaps) do
		M.set_keymaps(mode, k, v)
	end
end

-- Load key mappings for all provided modes
-- @param keymaps A list of key mappings for each mode
function M.load(keymaps)
	keymaps = keymaps or {}
	for mode, mapping in pairs(keymaps) do
		M.load_mode(mode, mapping)
	end
end

function M.get_defaults()
	local keys = {
		normal_mode = {
			["Q"] = "<nop>",
			["<C-f>"] = ':lua require("harpoon.term").sendCommand(1, "tmux-sessionizer\\n"); require("harpoon.term").gotoTerminal(1)<CR>',
			["<leader>vwh"] = ':h <C-R>=expand("<cword>")<CR><CR>',
			["<leader>bs"] = '/<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>',
			["<leader>u"] = ":UndotreeShow<CR>",
			["<leader>pv"] = ":Ex<CR>",
			["<leader>rp"] = ":resize 100<CR>",
			["<leader>+"] = ":vertical resize +5<CR>",
			["<leader>-"] = ":vertical resize -5<CR>",
			["<leader>s"] = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
			["<leader>gs"] = ":Scratch<CR>",
			["<leader>y"] = '"+y',
			["<leader>Y"] = 'gg"+yG',
			["<leader>d"] = '"_d',
			["<C-k>"] = ":cnext<CR>zz",
			["<C-j>"] = ":cprev<CR>zz",
			["<leader>k"] = ":lnext<CR>zz",
			["<leader>j"] = ":lprev<CR>zz",
			["<C-q>"] = ":call ToggleQFList(1)<CR>",
			["<leader>q"] = ":call ToggleQFList(0)<CR>",
			["gf"] = ":e <cfile><CR>",
		},

		visual_mode = {
			["J"] = ":m '>+1<CR>gv=gv",
			["K"] = ":m '<-2<CR>gv=gv",

			-- greatest remap ever
			["<leader>p"] = '"_dP',

			-- next greatest remap ever : asbjornHaland
			["<leader>y"] = '"+y',

			["<leader>d"] = '"_d',
		},

		insert_mode = { ["<C-c>"] = "<esc>" },

		term_mode = { ["<Esc>"] = "<C-\\><C-n>" },
	}

	return keys
end

return M
