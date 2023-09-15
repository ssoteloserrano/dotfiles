local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-K>", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>i", "<CMD>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    "<CMD>lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<CMD>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>q", "<CMD>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute "lua vim.lsp.buf.formatting()" ]]
end

return {
  lsp_keymaps = lsp_keymaps
}
