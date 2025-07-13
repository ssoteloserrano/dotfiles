-- Whitespace highlighting configuration using virtual text
-- Only highlights trailing whitespace (spaces/tabs at end of line) with a red block

local M = {}

local ns = vim.api.nvim_create_namespace("trailing-whitespace")

local function highlight_trailing_ws(bufnr)
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  for i, line in ipairs(lines) do
    local s, e = line:find("%s+$")
    if s then
      local trail = line:sub(s, e)
      for j = 0, #trail - 1 do
        vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, s - 1 + j, {
          virt_text = {{"█", "ErrorMsg"}}, -- red block, you can change to a custom group if you want
          virt_text_pos = 'overlay',
          hl_mode = 'combine',
        })
      end
    end
  end
end

function M.setup()
  vim.api.nvim_create_autocmd({"BufEnter", "TextChanged", "TextChangedI", "BufWritePost"}, {
    callback = function(args)
      local ft = vim.api.nvim_buf_get_option(args.buf, "filetype")
      if ft ~= "snacks_dashboard" then
        highlight_trailing_ws(args.buf)
      else
        vim.api.nvim_buf_clear_namespace(args.buf, ns, 0, -1)
      end
    end,
  })
end

M.setup()

return M 