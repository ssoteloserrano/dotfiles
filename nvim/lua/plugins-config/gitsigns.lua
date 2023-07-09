local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
  return
end

local icons = require("ui.icons")

gitsigns.setup({
  signs = {
    add = { text = icons.GitAdd2 },
    change = { text = icons.GitChange2 },
    delete = { text = icons.GitDelete2 },
    topdelete = { text = icons.GitDelete2 },
    changedelete = { text = icons.GitChange2 },
    untracked = { text = icons.GitAdd2 },
  },
})
