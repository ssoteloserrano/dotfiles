return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    local theme = "nightfox"
    local nightfox = require("nightfox")
    nightfox.setup({
      transparent = true,
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      }
    })
    nightfox.load()

    vim.cmd("colorscheme " .. theme)
  end
}
