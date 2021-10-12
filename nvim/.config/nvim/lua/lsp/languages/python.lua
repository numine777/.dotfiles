-- local function on_attach()
--     -- TODO: TJ told me to do this and I should do it because he is Telescopic
--     -- "Big Tech" "Cash Money" Johnson
-- end
-- require'lspconfig'.jedi_language_server.setup{on_attach=on_attach}

local root_files = {
    'setup.py',
    'pyproject.toml',
    'setup.cfg',
    'requirements.txt',
    '.git',
    'BUILD.bazel',
}
local util = require 'lspconfig/util'
-- npm i -g pyright
require("lspconfig").pyright.setup {
  cmd = {
    DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver",
    "--stdio",
  },
  root_dir = function(filename)
      return util.root_pattern(unpack(root_files))(filename) or
              util.path.dirname(filename)
      end,
  on_attach = require("lsp").common_on_attach,
  -- handlers = {
  --   ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  --     virtual_text = { spacing = 0, prefix = "" },
  --     underline = true,
  --     update_in_insert = true,
  --   }),
  -- },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        stubPath = "",
      },
    },
  },
}

