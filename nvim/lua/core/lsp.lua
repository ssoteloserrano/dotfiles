--------------------------------------------------------------------
-- Habilitación de Servidores de Lenguaje
--------------------------------------------------------------------
vim.lsp.enable({
  "pylsp",
  "lua_ls",
  "vale_ls",
})

--------------------------------------------------------------------
-- Configuración de diagnóstico de los lenguajes
--------------------------------------------------------------------
vim.diagnostic.config({
  virtual_lines = false,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

--------------------------------------------------------------------
-- Configuraciones generales para todoso los servidores de lenguaje
--------------------------------------------------------------------
local capabilities
local cmp_available, cmp = pcall(require, "blink.cmp")

if cmp_available then
  capabilities = cmp.get_lsp_capabilities()
else
  capabilities = vim.lsp.protocol.make_client_capabilities()
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'
end

vim.lsp.config("*", {
  capabilities = capabilities,
  root_markers = { ".git" },
})

--------------------------------------------------------------------
-- Configuración de keymaps
--------------------------------------------------------------------
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<Leader>i", vim.diagnostic.open_float, {})

--------------------------------------------------------------------
-- Configuración de autocomandos
--------------------------------------------------------------------
vim.cmd [[ command! Format execute "vim.lsp.buf.formatting" ]]
