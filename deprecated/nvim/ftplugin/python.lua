local python_arguments = {}

-- TODO replace with path argument
local flake8 = {
  LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
}

local isort = { formatCommand = "isort --quiet -", formatStdin = true }

local yapf = { formatCommand = "yapf --quiet", formatStdin = true }
local black = { formatCommand = "black --quiet -", formatStdin = true }

if O.lang.python.linter == "flake8" then
  table.insert(python_arguments, flake8)
end

if O.lang.python.isort then
  table.insert(python_arguments, isort)
end

require("lspconfig").efm.setup {
  -- init_options = {initializationOptions},
  cmd = { DATA_PATH .. "/lspinstall/efm/efm-langserver" },
  init_options = { documentFormatting = true, codeAction = false },
  filetypes = { "python" },
  settings = {
    rootMarkers = { ".git/", "requirements.txt", "BUILD.bazel" },
    languages = {
      python = python_arguments,
    },
  },
}

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
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = O.lang.python.diagnostics.virtual_text,
      signs = O.lang.python.diagnostics.signs,
      underline = O.lang.python.diagnostics.underline,
      update_in_insert = true,
    }),
  },
  settings = {
    rootMarkers = { ".git/", "requirements.txt", "BUILD.bazel" },
    python = {
      analysis = {
        typeCheckingMode = O.lang.python.analysis.type_checking,
        autoSearchPaths = O.lang.python.analysis.auto_search_paths,
        useLibraryCodeForTypes = O.lang.python.analysis.use_library_code_types,
      },
    },
  },
}

if O.plugin.debug.active and O.plugin.dap_install.active then
  local dap_install = require("dap-install")
  dap_install.config("python_dbg", {})
end
