function GetCurrentLineIndentation()
  local bufnr = vim.api.nvim_get_current_buf()

  -- Get the current cursor position
  local cursor = vim.api.nvim_win_get_cursor(0)
  local current_line = cursor[1]  -- Line number

  -- Get the contents of the current line
  local lines = vim.api.nvim_buf_get_lines(bufnr, current_line - 1, current_line, false)

  -- Extract the indentation from the current line
  local indentation = string.match(lines[1], "^%s*")
  return indentation
end

function VariablePrinter()
  local variable = vim.fn.expand("<cword>")
  local log_line

  -- TODO: set print option format
  -- TODO: print objects
  if vim.bo.filetype == "javascript" then
    log_line = "console.log('" .. variable .. " => ', JSON.stringify(" .. variable .. "));"
  elseif vim.bo.filetype == "python" then
    log_line = "print('" .. variable .. " => ', " .. variable .. ")"
  elseif vim.bo.filetype == "lua" then
    log_line = "print('" .. variable .. " => ' .. require('utils').dump(" .. variable .. "))"
  elseif vim.bo.filetype == "php" then
    log_line = "dd($" .. variable .. ");"
  else
    print("Unsupported filetype for logging")
    return
  end

  local indentation = GetCurrentLineIndentation()
  local msg_with_scope_indent = indentation .. log_line

  vim.fn.setreg("+", msg_with_scope_indent)
end

local options = { noremap = true, silent = true }

vim.keymap.set("n", "cp", ":lua VariablePrinter()<CR>", options)
