return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function ()
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_better_performance = 1
    vim.cmd("colorscheme gruvbox-material")
  end
}
