local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local icons = require("ui.icons")
local modified_icons = {}

for key, value in pairs(icons) do
  modified_icons[key] = value .. " "
end

navic.setup {
  icons = modified_icons,
  highlight = false,
  separator = " " .. modified_icons.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true
}
