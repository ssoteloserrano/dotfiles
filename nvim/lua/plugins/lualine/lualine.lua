local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
  return
end

local icons = require("ui.icons")
local colors = require("ui.colors")
local custom_theme = require("plugins.lualine.custom_theme")
local scar_theme = custom_theme.get_custom_theme()

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local user_name = {
  -- mode component
  function()
    return "アーチ"
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.blue,
      i = colors.green,
      v = colors.violet,
      [""] = colors.violet,
      V = colors.violet,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  cond = conditions.hide_in_width,
}

local custom_diff = {
  "diff",
  symbols = {
    added = icons["GitAdd"] .. " ",
    modified = icons["GitChange"] .. " ",
    removed = icons["GitDelete"] .. " "
  },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

local lsp = {
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = icons["LSP"] .. " ",
  cond = conditions.hide_in_width,
}

local custom_git_blame = function(git_icon)
  vim.g.gitblame_display_virtual_text = 0
  local git_blame = require("gitblame")
  if git_blame == nil then
      return ""
  else
    vim.g.gitblame_date_format = "%r"
    vim.g.gitblame_message_template = git_icon .. " <date> • <author>"
    return git_blame.get_current_blame_text
  end
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = scar_theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = " ", right = "" },
    disabled_filetypes = { "neo-tree" },
    always_divide_middle = false,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { user_name },
    lualine_c = { custom_git_blame(icons["Git"]), lsp },
    lualine_x = { "filetype", "diagnostics" },
    lualine_y = { custom_diff },
    lualine_z = { "branch" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "diagnostics" },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
