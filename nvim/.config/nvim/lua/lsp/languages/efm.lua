local python_arguments = {}

local flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
  }

local black = { formatCommand = "black --quiet -", formatStdin = true}

local isort = { formatCommand = "isort --quiet -", formatStdin = true}

table.insert(python_arguments, flake8)
table.insert(python_arguments, black)
table.insert(python_arguments, isort)

local lua_arguments = {}

local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

local lua_fmt = {
    formatCommand = "luafmt --indent-count 2 --line-width 120 --stdin",
    formatStdin = true
}

table.insert(lua_arguments, lua_fmt)
table.insert(lua_arguments, luaFormat)

local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local tsserver_args = {}

table.insert(tsserver_args, prettier)
table.insert(tsserver_args, eslint)

require("lspconfig").efm.setup {
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"lua", "python", "javascriptreact", "javascript", "typescript","typescriptreact","sh", "html", "css", "json", "yaml", "markdown", "vue"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = python_arguments,
            lua = lua_arguments,
            javascript = tsserver_args,
            javascriptreact = tsserver_args,
			typescript = tsserver_args,
			typescriptreact = tsserver_args,
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
        }
    }
}

