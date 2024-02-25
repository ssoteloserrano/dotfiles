return {
  "iamcco/markdown-preview.nvim",
  build = function() vim.fn["mkdp#util#install"]() end,
  config = function()
    local options = { noremap = true, silent = true }
    vim.keymap.set("n", "<Leader>m", "<CMD>MarkdownPreview<CR>", options)
  end,
}
