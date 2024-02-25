return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    require("toggleterm").setup {
      size = 14,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 1,
      start_in_insert = true,
      persist_size = true,
      direction = "horizontal"
    }

    vim.keymap.set("n", "tt", "<CMD>ToggleTerm<CR>", { desc = "[T]oggle [T]erminal" })
    vim.keymap.set("n", "tl", "<CMD>ToggleTermSendCurrentLine<CR>")
    vim.keymap.set("n", "tv", "<CMD>ToggleTermSendVisualLines<CR>")
  end
}
