return {
  "atiladefreitas/dooing",
  version = "v2.4.4",
  config = function()
    local icons = require("config.ui.icons")
    local colors = require("config.ui.colors")

    require("dooing").setup({
      notes = {
        icon = icons.File,
      },
    --   window = {
    --       width = 55,
    --       height = 20,
    --       border = 'rounded',
    --       position = 'top',
    --   },
      keymaps = {
        open_todo_scratchpad = "l",
      },
      scratchpad = {
        syntax_highlight = "markdown"
      },
      priorities = {
        {
          name = "important",
          weight = 4,
        },
        {
          name = "urgent",
          weight = 2,
        },
      },
      priority_groups = {
        high = {
          members = { "important", "urgent" },
          color = colors.cyan,
          hl_group = "DiagnosticError",
        },
        medium = {
          members = { "important" },
          color = colors.violet,
          hl_group = "DiagnosticWarn",
        },
        low = {
          members = { "urgent" },
          color = colors.red,
          hl_group = "DiagnosticInfo",
        },
      },
    })
  end,
}
