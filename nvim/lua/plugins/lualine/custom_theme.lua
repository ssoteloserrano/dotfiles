local custom_theme = {}

local colors = require("config.ui.colors")

function custom_theme.get_custom_theme()
  return {
    normal = {
      a = { fg = colors.black, bg = colors.blue },
      b = { fg = colors.white, bg = colors.darkblue },
      c = { fg = colors.white },
    },
    insert = { a = { fg = colors.black, bg = colors.green } },
    visual = { a = { fg = colors.black, bg = colors.violet } },
    select = { a = { fg = colors.black, bg = colors.orange } },
    replace = { a = { fg = colors.black, bg = colors.red } },
    terminal = { a = { fg = colors.black, bg = colors.red } },
    inactive = {
      a = { fg = colors.white, bg = colors.darkblue },
      b = { fg = colors.white, bg = colors.darkblue },
      c = { fg = colors.white, bg = colors.darkblue },
    },
  }
end

return custom_theme
