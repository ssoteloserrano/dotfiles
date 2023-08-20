function VariablePrinter()
  local variable = vim.fn.expand('<cword>')
  local log_line

  if vim.bo.filetype == "javascript" then
    log_line = "console.log('" .. variable .. " => ', JSON.stringify(" .. variable .. "));"
  elseif vim.bo.filetype == "python" then
    log_line = "print('" .. variable .. " => ', " .. variable .. ")"
  else
    print("Unsupported filetype for logging")
    return
  end

  vim.fn.setreg('+', log_line)
end

local options = { noremap = true, silent = true }

vim.keymap.set("n", "cp", ":lua VariablePrinter()<CR>", options)
