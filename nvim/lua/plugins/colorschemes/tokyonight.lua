return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    require("tokyonight").setup({
      style = "moon",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "help" },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
    })
    vim.cmd("colorscheme tokyonight")
  end
}
