local status_ok, nvim_comment = pcall(require, "nvim_comment")
if not status_ok then
  return
end

nvim_comment.setup({
	comment_empty = false,
	operator_mapping = "cc",
})

local options = { noremap = true, silent = true }
vim.keymap.set("n", "cc", "<CMD>CommentToggle<CR>", options)
vim.keymap.set("n", "<Leader>t", "<CMD>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
