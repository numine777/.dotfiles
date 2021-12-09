vim.cmd 'let g:neoformat_enabled_dart = ["format"]'

vim.cmd 'let g:neoformat_enabled_python = ["black", "isort", "docformatter"]'

vim.cmd "let g:neoformat_javascript_prettier = { 'exe': 'prettier', 'args': ['--tab-width 4'], 'replace': 1 }"
vim.cmd "let g:neoformat_javascriptreact_prettier = { 'exe': 'prettier', 'args': ['--tab-width 4'], 'replace': 1  }"
vim.cmd "let g:neoformat_typescript_prettier = { 'exe': 'prettier', 'args': ['--tab-width 4'], 'replace': 1  }"
vim.cmd "let g:neoformat_typescriptreact_prettier = { 'exe': 'prettier', 'args': ['--tab-width 4'], 'replace': 1  }"
vim.cmd 'let g:neoformat_enabled_javascript = ["prettier"]'
vim.cmd 'let g:neoformat_enabled_javascriptreact = ["prettier"]'
vim.cmd 'let g:neoformat_enabled_typescript = ["prettier"]'
vim.cmd 'let g:neoformat_enabled_typescriptreact = ["prettier"]'

-- vim.cmd "let g:neoformat_cpp_clangformat = { 'exe': 'clang-format', 'args': ['-style=\"{BasedOnStyle: LLVM, IndentWidth: 4}\"', '-assume-filename=' . expand('%:t')], 'stdin': 1 }"
vim.cmd 'let g:neoformat_enabled_cpp = ["clangformat"]'
