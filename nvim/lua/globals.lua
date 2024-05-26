P = function (v)
  print(vim.inspect(v))
  return v
end

RELOAD = function (...)
  return require("plenary.reload").reload_module(...)
end

R = function (name)
  RELOAD(name)
  return require(name)
end

PP = function (v)
  local bufnr = vim.api.nvim_get_current_buf()
  local v_str = vim.inspect(v)
  local lines = vim.split(v_str, '\n')
  
  vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, lines)
  print(v_str)
end
