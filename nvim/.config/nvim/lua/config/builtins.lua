local M = {}

local builtins = {
    "lv-cmp",
    "lv-autopairs",
    -- "lsp.null-ls",
}

function M.config(config)
  for _, builtin_path in ipairs(builtins) do
    local builtin = require(builtin_path)
    builtin.config(config)
  end
end

return M
