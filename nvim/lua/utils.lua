local utils = {}

function utils.get_current_os()
    return package.config:sub(1,1) == "\\" and "win" or "unix"
end

function utils.get_project_root()
  local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    -- if not git then check for Dockerfile or docker-compose.yaml/docker-compose.yml
    local dockerfile = vim.fn.findfile("Dockerfile", ".;")
    local dockercompose = vim.fn.findfile("docker-compose.yaml;docker-compose.yml", ".;")
    
    if dockerfile ~= "" then
      root = vim.fn.fnamemodify(dockerfile, ":h")
    elseif dockercompose ~= "" then
      root = vim.fn.fnamemodify(dockercompose, ":h")
    else
      -- if no Dockerfile or docker-compose.yaml/docker-compose.yml found, get LSP root
      -- will get the configured root directory of the first attached lsp. You will have problems if you are using multiple lsps
      root = vim.lsp.get_active_clients()[1].config.root_dir
    end
  end
  return root
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
