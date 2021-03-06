local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
dart_capabilities.textDocument.codeAction = {
	dynamicRegistration = false,
	codeActionLiteralSupport = {
		codeActionKind = {
			valueSet = {
				"",
				"quickfix",
				"refactor",
				"refactor.extract",
				"refactor.inline",
				"refactor.rewrite",
				"source",
				"source.organizeImports",
			},
		},
	},
}

require("flutter-tools").setup({
	ui = {
		-- the border type to use for all floating windows, the same options/formats
		-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
		border = "rounded",
	},
	decorations = {
		statusline = {
			-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
			-- this will show the current version of the flutter app from the pubspec.yaml file
			app_version = true,
			-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
			-- this will show the currently running device if an application was started with a specific
			-- device
			device = true,
		},
	},
	widget_guides = {
		enabled = true,
	},
	closing_tags = {
		highlight = "ErrorMsg", -- highlight for the closing tag
		prefix = ">", -- character to use for close tag e.g. > Widget
		enabled = true, -- set to false to disable
	},
	dev_log = {
		open_cmd = "tabedit", -- command to use to open the log buffer
	},
	debugger = { -- integrate with nvim dap + install dart code debugger
		enabled = true,
	},
	dev_tools = {
		autostart = false, -- autostart devtools server if not detected
		auto_open_browser = false, -- Automatically opens devtools in the browser
	},
	outline = {
		open_cmd = "30vnew", -- command to use to open the outline buffer
		auto_open = false, -- if true this will open the outline automatically when it is first populated
	},
	lsp = {
		on_attach = require("lsp").common_on_attach,
		capabilities = dart_capabilities, -- e.g. lsp_status capabilities
		--- OR you can specify a function to deactivate or change or control how the config is created
		settings = {
			showTodos = true,
			completeFunctionCalls = true,
			-- analysisExcludedFolders = {<path-to-flutter-sdk-packages>}
		},
	},
})

require("telescope").load_extension("flutter")

local dap = require("dap")
dap.adapters.dart = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/.local/share/nvim/opt/dap/Dart-Code/out/dist/debug.js", "flutter" },
}
dap.configurations.dart = {
	{
		type = "dart",
		request = "launch",
		name = "Launch flutter",
		dartSdkPath = os.getenv("HOME") .. "/bin/flutter/bin/cache/dart-sdk/",
		flutterSdkPath = os.getenv("HOME") .. "/bin/flutter",
		-- program = "${workspaceFolder}/lib/main.dart",
		-- cwd = "${workspaceFolder}",
	},
}

vim.cmd('nnoremap <leader>bp :lua require"dap".toggle_breakpoint()<CR>')
vim.cmd('nnoremap <leader>bc :lua require"dap".continue()<CR>')
vim.cmd('nnoremap <leader>bso :lua require"dap".step_over()<CR>')
vim.cmd('nnoremap <leader>bsi :lua require"dap".step_into()<CR>')
vim.cmd('nnoremap <leader>bo :lua require"dap".repl.open()<CR>')
