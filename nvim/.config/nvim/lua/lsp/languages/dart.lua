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
  cmd = { "dart", "/Users/scott/bin/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },
  linters = { "dart", "/Users/scott/bin/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },
  on_attach = require("lsp").common_on_attach;
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    suggestFromUnimportedLibraries = false,
    closingLabels = true,
  };
  capabilities = dart_capabilities;
})
