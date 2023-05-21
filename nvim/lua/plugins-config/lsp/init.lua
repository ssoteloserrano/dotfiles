local lspconfig_is_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_is_ok then
  return
end

require("plugins-config.lsp.mason-lspconfig")
require("plugins-config.lsp.handlers").setup()

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
