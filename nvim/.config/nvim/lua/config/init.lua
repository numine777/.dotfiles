local M = {}

local function apply_defaults(configs, defaults)
  configs = configs or {}
  return vim.tbl_deep_extend("keep", configs, defaults)
end

--- Initialize dvim default configuration
-- Define dvim global variable
function M:init(opts)
  opts = opts or {}
  self.path = opts.path

  require("config.defaults")

  local builtins = require("config.builtins")
  local keybindings = require("keybindings")
  builtins.config(self)

  local default_keymaps = keybindings.get_defaults()
  dvim.keys = apply_defaults(dvim.keys, default_keymaps)

  vim.g.mapleader = (dvim.leader == "space" and " ") or dvim.leader
  keybindings.load(dvim.keys)

  require('impatient')
end

return M
