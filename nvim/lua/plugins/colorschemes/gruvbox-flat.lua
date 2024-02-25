return {
  "eddyekofo94/gruvbox-flat.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    vim.g.gruvbox_transparent = true
    vim.g.gruvbox_dark_sidebar = false
    vim.cmd[[colorscheme gruvbox-flat]]
  end
}
