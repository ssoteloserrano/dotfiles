local lspconfig_is_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_is_ok then
  return
end

local diagnostic_config = require("plugins-config.lsp.diagnostic.diagnostic")

require("plugins-config.lsp.mason")
require("plugins-config.lsp.lsp-handlers").setup(diagnostic_config)

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
