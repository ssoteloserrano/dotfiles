local utils = {}

function utils.get_current_os()
    return package.config:sub(1,1) == "\\" and "win" or "unix"
end

function utils.get_project_root()
  local active_lsp_clients = vim.lsp.get_active_clients()
  if type(active_lsp_clients) == "table" and next(active_lsp_clients) ~= nil then
    return active_lsp_clients[1].config.root_dir
  end

  local files = vim.fn.split(".git,Dockerfile,docker-compose.yaml,docker-compose.yml,index.md,index.yml", ",")

  for _, file in ipairs(files) do
    local result = vim.fn.findfile(file, ".;")
    if result ~= "" then
      return vim.fn.fnamemodify(file, ":h");
    end
  end

  return vim.fn.getcwd()
end

function utils.isempty(s)
  return s == nil or s == ""
end

function utils.get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

function utils.merge_tables(...)
  local result = {}
    for _, table_to_merge in ipairs({...}) do
        for key, value in pairs(table_to_merge) do
            result[key] = value
        end
    end
    return result
end

function utils.dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. utils.dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

return utils
