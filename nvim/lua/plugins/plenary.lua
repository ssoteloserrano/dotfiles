return {
  "nvim-lua/plenary.nvim",
  config = function ()
    local options = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>t", "<Plug>PlenaryTestFile", options)
  end
}
