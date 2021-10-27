local M = {}

--- Initialize lvim default configuration
-- Define lvim global variable
function M:init(opts)
  opts = opts or {}
  self.path = opts.path
  -- require('impatient')

  require "config.defaults"

  local builtins = require "config.builtins"
  builtins.config(self)

end

return M
