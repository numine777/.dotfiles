local M = {}

M.config = function()
  -- Define this minimal config so that it's available if telescope is not yet available.
  local ok, actions = pcall(require, "telescope.actions")
  if not ok then
    return
  end
  require("telescope").setup({
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.75,
        preview_cutoff = 120,
        horizontal = { mirror = false },
        vertical = { mirror = false },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      mappings = {
        i = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-c>"] = actions.close,
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          ["<CR>"] = actions.select_default + actions.center,
        },
        n = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        },
      },
      file_ignore_patterns = {},
      path_display = { shorten = 5 },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      pickers = {
        find_files = {
          find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
        },
        live_grep = {
          --@usage don't include the filename in the search results
          only_sort_text = true,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  })
end

local actions = require("telescope.actions")
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = vim.env.DOTFILES,
		hidden = true,
	})
end

local function refactor(prompt_bufnr)
	local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
	require("telescope.actions").close(prompt_bufnr)
	require("refactoring").refactor(content.value)
end

M.refactors = function()
	require("telescope.pickers").new({}, {
		prompt_title = "refactors",
		finder = require("telescope.finders").new_table({
			results = require("refactoring").get_refactors(),
		}),
		sorter = require("telescope.config").values.generic_sorter({}),
		attach_mappings = function(_, map)
			map("i", "<CR>", refactor)
			map("n", "<CR>", refactor)
			return true
		end,
	}):find()
end

M.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end

local function set_background(content)
    vim.fn.system(
        "dconf write /org/mate/desktop/background/picture-filename \"'"
            .. content
            .. "'\""
    )
end

local function select_background(prompt_bufnr, map)
    local function set_the_background(close)
        local content = require("telescope.actions.state").get_selected_entry(
            prompt_bufnr
        )
        set_background(content.cwd .. "/" .. content.value)
        if close then
            require("telescope.actions").close(prompt_bufnr)
        end
    end

    map("i", "<C-p>", function()
        set_the_background()
    end)

    map("i", "<CR>", function()
        set_the_background(true)
    end)
end

local function image_selector(prompt, cwd)
    return function()
        require("telescope.builtin").find_files({
            prompt_title = prompt,
            cwd = cwd,

            attach_mappings = function(prompt_bufnr, map)
                select_background(prompt_bufnr, map)

                -- Please continue mapping (attaching additional key maps):
                -- Ctrl+n/p to move up and down the list.
                return true
            end,
        })
    end
end

M.anime_selector = image_selector("< Anime Bobs > ", "~/backgrounds")

vim.cmd('nnoremap <leader>rr :lua require("lv-telescope").refactors()<CR>')
vim.cmd('vnoremap <leader>rr :lua require("lv-telescope").refactors()<CR>')
vim.cmd(
	'nnoremap <leader>ps :lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>'
)
vim.cmd('nnoremap <C-p> :lua require("telescope.builtin").git_files()<CR>')
vim.cmd('nnoremap <Leader>pf :lua require("telescope.builtin").find_files()<CR>')

vim.cmd('nnoremap <leader>pw :lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
vim.cmd('nnoremap <leader>pb :lua require("telescope.builtin").buffers()<CR>')
vim.cmd('nnoremap <leader>vh :lua require("telescope.builtin").help_tags()<CR>')
vim.cmd('nnoremap <leader>vrc :lua require("lv-telescope").search_dotfiles()<CR>')
vim.cmd('nnoremap <leader>va :lua require("lv-telescope").anime_selector()<CR>')
-- vim.cmd('nnoremap <leader>vc :lua require("lv-telescope").chat_selector()<CR>')
vim.cmd('nnoremap <leader>gc :lua require("lv-telescope").git_branches()<CR>')
vim.cmd('nnoremap <leader>gw :lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')
vim.cmd('nnoremap <leader>gm :lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')

return M
