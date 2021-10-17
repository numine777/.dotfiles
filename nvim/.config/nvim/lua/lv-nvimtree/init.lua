local M = {}
-- local Log = require "dvim.core.log"

function M.config()
  dvim.builtin.nvimtree = {
    active = true,
    on_config_done = nil,
    setup = {
      open_on_setup = false,
      auto_close = true,
      open_on_tab = false,
      disable_netrw = false,
      update_focused_file = {
        enable = false,
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 30,
        side = "left",
        auto_resize = false,
        mappings = {
          custom_only = false,
        },
      },
    },
    show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      folder_arrows = 1,
      tree_width = 30,
    },
    -- ignore = { ".git", "node_modules", ".cache" },
    quit_on_open = 1,
    hide_dotfiles = 0,
    git_hl = 1,
    -- root_folder_modifier = ":t",
    allow_resize = 1,
    -- auto_ignore_ft = { "startify", "dashboard" },
    icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
      },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
      },
    },
  }
end

function M.setup()
  local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not status_ok then
    -- Log:error "Failed to load nvim-tree.config"
    return
  end
  local g = vim.g

  for opt, val in pairs(dvim.builtin.nvimtree) do
    g["nvim_tree_" .. opt] = val
  end

  -- Implicitly update nvim-tree when project module is active
  -- if dvim.builtin.project.active then
  --   dvim.builtin.nvimtree.respect_buf_cwd = 1
  --   dvim.builtin.nvimtree.setup.update_cwd = true
  --   dvim.builtin.nvimtree.setup.disable_netrw = false
  --   dvim.builtin.nvimtree.setup.hijack_netrw = false
  --   vim.g.netrw_banner = false
  -- end

  local tree_cb = nvim_tree_config.nvim_tree_callback

  if not dvim.builtin.nvimtree.setup.view.mappings.list then
    dvim.builtin.nvimtree.setup.view.mappings.list = {
      { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      { key = "h", cb = tree_cb "close_node" },
      { key = "v", cb = tree_cb "vsplit" },
    }
  end

  if dvim.builtin.nvimtree.on_config_done then
    dvim.builtin.nvimtree.on_config_done(nvim_tree_config)
  end
  require("nvim-tree").setup(dvim.builtin.nvimtree.setup)
end

function M.change_tree_dir(dir)
  local lib_status_ok, lib = pcall(require, "nvim-tree.lib")
  if lib_status_ok then
    lib.change_dir(dir)
  end
end

return M
