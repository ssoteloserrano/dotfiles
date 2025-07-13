return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  event = "VeryLazy",
  version = "2.*",
  config = function()
    local colors = require("config.ui.colors")
    require("window-picker").setup({
      autoselect_one = true,
      include_current = false,
      filter_rules = {
        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          buftype = { "terminal", "quickfix", "nofile" },
        },
      },
      picker_config = {
        statusline_winbar_picker = {
          -- whether you want to use winbar instead of the statusline
          -- "always" means to always use winbar,
          -- "never" means to never use winbar
          -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
          use_winbar = 'smart', -- "always" | "never" | "smart"
        },
      },
      highlights = {
        statusline = {
          focused = {
            fg = colors.darkblue,
            bg = colors.red,
            bold = true,
          },
          unfocused = {
            fg = colors.darkblue,
            bg = colors.cyan,
            bold = true,
          },
        },
        winbar = {
          focused = {
            fg = colors.darkblue,
            bg = colors.red,
            bold = true,
          },
          unfocused = {
            fg = colors.darkblue,
            bg = colors.cyan,
            bold = true,
          },
        },
      },
    })
  end
}
