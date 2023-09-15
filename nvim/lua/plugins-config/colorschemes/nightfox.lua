local nightfox_status_ok, nightfox = pcall(require, "nightfox")
if not nightfox_status_ok then
  return
end

local theme = "nightfox"
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
