local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status_ok then
  return
end

catppuccin.setup({
    transparent_background = true
})

-- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd("colorscheme catppuccin-mocha")
