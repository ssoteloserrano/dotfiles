local lsp_handlers = {}

lsp_handlers.setup = function(diagnostic_config)
  vim.diagnostic.config(diagnostic_config)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

lsp_handlers.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end
  client.server_capabilities.semanticTokensProvider = nil
  require("plugins.lsp.navic-attacher").attach_navic_to_buffer(client, bufnr)
  require("plugins.lsp.lsp-keymaps").lsp_keymaps(bufnr)
  require("plugins.lsp.lsp-highlight").lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp_ = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  print("handlers:" .. tostring(status_ok))
else
  lsp_handlers.capabilities = cmp_nvim_lsp_.default_capabilities(capabilities)
end

return lsp_handlers
