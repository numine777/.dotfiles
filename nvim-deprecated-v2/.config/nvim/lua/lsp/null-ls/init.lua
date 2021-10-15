local M = {}

function M.config()
    local null_ls = require("null-ls")
    dvim.builtin.null_ls = {
        sources = {
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.dart_format,
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.shfmt,
            null_ls.builtins.formatting.stylua.with({
                extra_args = { "--config-path", vim.fn.expand("~/.config/stylua.toml") },
            }),
            null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.diagnostics.pylint,
            null_ls.builtins.code_actions.gitsigns,
        },
    }
    null_ls.config({ sources = dvim.builtin.null_ls.sources })
end

return M
