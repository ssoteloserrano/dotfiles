local bufferline_status_ok, bufferline = pcall(require, "bufferline")
if not bufferline_status_ok then
  return
end

bufferline.setup {
  options = {
    mode = "buffers",                    -- set to "tabs" to only show tabpages instead
    numbers = "ordinal",                 -- "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    sort_by = "insert_at_end",
    separator_style = "thin",            -- "slant" | "slope" | "thick" | "thin" | { "any", "any" },
    show_buffer_icons = true,           -- disable filetype icons for buffers
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        highlights = "NvimTreeNormal",
        padding = 1,
      }
    },
  }
}

vim.keymap.set("n", "<Leader>bd", "<CMD>bdelete!<CR>")
vim.keymap.set("n", "<Leader>1", "<CMD>BufferLineGoToBuffer 1<CR>")
vim.keymap.set("n", "<Leader>2", "<CMD>BufferLineGoToBuffer 2<CR>")
vim.keymap.set("n", "<Leader>3", "<CMD>BufferLineGoToBuffer 3<CR>")
vim.keymap.set("n", "<Leader>4", "<CMD>BufferLineGoToBuffer 4<CR>")
vim.keymap.set("n", "<Leader>5", "<CMD>BufferLineGoToBuffer 5<CR>")
vim.keymap.set("n", "<Leader>6", "<CMD>BufferLineGoToBuffer 6<CR>")
vim.keymap.set("n", "<Leader>7", "<CMD>BufferLineGoToBuffer 7<CR>")
vim.keymap.set("n", "<Leader>8", "<CMD>BufferLineGoToBuffer 8<CR>")
vim.keymap.set("n", "<Leader>9", "<CMD>BufferLineGoToBuffer 9<CR>")
vim.keymap.set("n", "<Leader>$", "<CMD>BufferLineGoToBuffer -1<CR>")
