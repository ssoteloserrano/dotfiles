function VariablePrinter()
  local variable = vim.fn.expand("<cword>")
  local log_line

  -- TODO: set print option format
  -- TODO: get current indentation level
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

  vim.fn.setreg("+", log_line)
end

local options = { noremap = true, silent = true }

vim.keymap.set("n", "cp", ":lua VariablePrinter()<CR>", options)
