local modicator_status_ok, modicator = pcall(require, "modicator")
if not modicator_status_ok then
  return
end

local colors = require("ui.colors")

modicator.setup({
  show_warnings = true,
  highlights = {
    defaults = {
      foreground = colors.blue,
      bold = true,
      italic = true
    },
    modes = {
      ["n"] = {
        foreground = colors.blue,
      },
      ["i"]  = {
        foreground = colors.green,
      },
      ["v"]  = {
        foreground = colors.violet,
      },
      ["V"]  = {
        foreground = colors.violet,
      },
      ["�"] = { -- This symbol is the ^V character
        -- foreground = modicator.get_highlight_fg("Type"),
        foreground = colors.blue,
      },
      ["s"]  = {
        -- foreground = modicator.get_highlight_fg("Keyword"),
        foreground = colors.blue,
      },
      ["S"]  = {
        -- foreground = modicator.get_highlight_fg("Keyword"),
        foreground = colors.blue,
      },
      ["R"]  = {
        -- foreground = modicator.get_highlight_fg("Title"),
        foreground = colors.blue,
      },
      ["c"]  = {
        -- foreground = modicator.get_highlight_fg("Constant"),
        foreground = colors.blue,
      },
    },
  },
})
