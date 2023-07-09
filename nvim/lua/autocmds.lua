vim.cmd [[autocmd FileType javascript setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType html setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType css setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType lua setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4]]
vim.cmd [[autocmd FileType php setlocal expandtab shiftwidth=2 softtabstop=2]]

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})
