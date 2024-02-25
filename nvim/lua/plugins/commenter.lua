return {
  "terrortylor/nvim-comment",
  config = function ()
    require("nvim_comment").setup({
      comment_empty = false,
      operator_mapping = "cc",
    })

    local options = { noremap = true, silent = true }
    vim.keymap.set("n", "cc", "<CMD>CommentToggle<CR>", options)
  end
}
