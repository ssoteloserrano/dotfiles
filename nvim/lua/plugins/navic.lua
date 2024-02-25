return {
  "SmiteshP/nvim-navic",
  dependencies = "neovim/nvim-lspconfig",
  config = function ()
    local icons = require("ui.icons")
    local modified_icons = {}

    for key, value in pairs(icons) do
      modified_icons[key] = value .. " "
    end

    require("nvim-navic").setup {
      icons = modified_icons,
      highlight = false,
      separator = " " .. modified_icons.ChevronRight .. " ",
      depth_limit = 0,
      depth_limit_indicator = "..",
      safe_output = true
    }
  end
}
