vim.cmd [[autocmd FileType javascript setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType html setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType css setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType lua setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4]]
vim.cmd [[autocmd FileType php setlocal expandtab shiftwidth=4 softtabstop=4]]
vim.cmd [[autocmd FileType markdown setlocal conceallevel=1]]

-- vim.cmd([[
--     autocmd FileType javascript setlocal makeprg=docker\ compose\ exec\ node\ npm\ run\ test
--     autocmd FileType javascript setlocal errorformat=%f:%l:%c:%m,%f:%l:%m,%f:%l%m
-- ]])

vim.g.test_conatiner = ''

-- Function to set the container name
function SetContainerName(container_name)
  vim.g.test_conatiner = container_name
  vim.cmd(string.format([[
      autocmd FileType python setlocal makeprg=docker\ compose\ run\ %s\ python\ -m\ pytest
  ]], container_name))
  vim.cmd(string.format([[
      autocmd FileType javascript setlocal makeprg=docker\ compose\ run\ %s\ npm\ run\ test
  ]], container_name))
end

-- Attach the function to a command with an argument
vim.cmd([[command! -nargs=1 SetTestContainerName lua SetContainerName(<q-args>)]])

local function is_valid_message(message, ignore_warnings)
  if message == nil then
    return false
  end

  if ignore_warnings == false then
    return true
  end

  local lowercase_message = string.lower(message)
  return lowercase_message:match("(warning+)") == nil
end

function RunTests()
  if vim.g.test_conatiner ~= '' then
    local test_command = string.format("docker-compose run %s python -m pytest", vim.g.test_conatiner)
    local output = vim.fn.system(test_command)
    local ignore_warnings = true

    local quickfix_list = {}

    local already_failure = false
    local scope = ""

    for line in vim.gsplit(output, "\n") do
      local failures = string.find(line, "FAILURES")

      if failures or already_failure then
        already_failure = true
        local scope_pattern = "%b[]"
        local match = line:match(scope_pattern)
        if match then
          scope = match
          failures = nil
          already_failure = false
        end
      end

      local file, line_number, message = line:match("^(.-):(%d+): (.*)")

      if file and line_number and is_valid_message(message, ignore_warnings) then
        table.insert(quickfix_list, {
          filename = file,
          lnum = tonumber(line_number),
          text = message .. " " .. scope
        })
      end
    end

    if next(quickfix_list) == nil then
      print("Tests passed!")
      vim.fn.setqflist({})
    else
      vim.fn.setqflist({}, 'r', {title = 'pytest', items = quickfix_list})
      vim.api.nvim_command("copen")
    end
  else
      print("Please set the test container name using :SetTestContainerName")
  end
end

vim.cmd([[command! RunTests lua RunTests()]])

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})
