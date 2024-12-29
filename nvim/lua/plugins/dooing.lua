return {
  "atiladefreitas/dooing",
  config = function()
    local icons = require("ui.icons")
    local colors = require("ui.colors")

    require("dooing").setup({
      notes = {
        icon = icons.File,
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
      keymaps = {
        open_todo_scratchpad = "<CR>",
      },
      scratchpad = {
        syntax_highlight = "markdown"
      }
    })
  end,
}
