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

    local function toggle_python_or_terminal()
      local filetype = vim.bo.filetype
      local filename = vim.fn.expand("%:p")
      if filetype == "python" then
        -- Open terminal and run Python file
        vim.cmd("ToggleTerm")
        vim.fn.feedkeys("python3 " .. filename .. "\n", "n")
      else
        -- Open terminal in the current file's directory
        vim.cmd("ToggleTerm dir=%:p:h")
      end
    end

    vim.keymap.set("n", "tt", toggle_python_or_terminal, { desc = "[T]oggle [T]erminal" })
    vim.keymap.set("n", "tl", "<CMD>ToggleTermSendCurrentLine<CR>")
    vim.keymap.set("n", "tv", "<CMD>ToggleTermSendVisualLines<CR>")
  end
}
