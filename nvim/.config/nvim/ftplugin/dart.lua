-- require("lspconfig").dartls.setup {
--   cmd = { "dart", O.lang.dart.sdk_path, "--lsp" },
--   on_attach = require("lsp").common_on_attach,
--   init_options = {
--     closingLabels = false,
--     flutterOutline = false,
--     onlyAnalyzeProjectsWithOpenFiles = false,
--     outline = false,
--     suggestFromUnimportedLibraries = true,
--   },
-- }
-- Flutter tools setup
local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
dart_capabilities.textDocument.codeAction = {
  dynamicRegistration = false;
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
              };
          };
      };
}
require'lspconfig'.dartls.setup({
  on_attach = require("lsp").common_on_attach;
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    suggestFromUnimportedLibraries = false,
    closingLabels = true,
  };
  capabilities = dart_capabilities;
})

-- require("flutter-tools").setup{
--   ui = {
--     border = "rounded",
--   },
--   debugger = { -- integrate with nvim dap + install dart code debugger
--     enabled = false,
--   },
--   widget_guides = {
--     enabled = true,
--   },
--   closing_tags = {
--     highlight = "ErrorMsg", -- highlight for the closing tag
--     prefix = ">", -- character to use for close tag e.g. > Widget
--     enabled = true -- set to false to disable
--   },
--   dev_tools = {
--     autostart = true, -- autostart devtools server if not detected
--     auto_open_browser = true, -- Automatically opens devtools in the browser
--   },
--   outline = {
--     open_cmd = "30vnew", -- command to use to open the outline buffer
--   },
--   lsp = {
--     on_attach = require("lsp").common_on_attach,
--     capabilities = dart_capabilities, -- e.g. lsp_status capabilities
--     init_options = {
--       onlyAnalyzeProjectsWithOpenFiles = true,
--       suggestFromUnimportedLibraries = false,
--       closingLabels = true,
--     },
--     settings = {
--       showTodos = true,
--       completeFunctionCalls = true,
--       analysisExcludedFolders = {}
--     }
--   }
-- }

if O.plugin.debug.active and O.plugin.dap_install.active then
  local dap_install = require("dap-install")
  dap_install.config("dart_dbg", {})
end
