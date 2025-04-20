return {
  "echasnovski/mini.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("mini.ai").setup()
    require("mini.surround").setup()

    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
  end,
}
