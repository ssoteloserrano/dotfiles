return {
  "tiagovla/tokyodark.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    vim.g.tokyodark_transparent_background = true
    vim.g.tokyodark_enable_italic_comment = true
    vim.g.tokyodark_enable_italic = true
    vim.g.tokyodark_color_gamma = "1.0"
    vim.cmd("colorscheme tokyodark")
  end
}
