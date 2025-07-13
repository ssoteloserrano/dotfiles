return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local icons = require("config.ui.icons")
    require("gitsigns").setup({
      signs = {
        add = { text = icons.GitAdd2 },
        change = { text = icons.GitChange2 },
        delete = { text = icons.GitDelete2 },
        topdelete = { text = icons.GitDelete2 },
        changedelete = { text = icons.GitChange2 },
        untracked = { text = icons.GitAdd2 },
      },
    })
  end,
}
