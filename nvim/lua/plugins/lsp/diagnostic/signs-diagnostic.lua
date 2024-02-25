local setup = function()
  local signs_definition = {
    { name = "DiagnosticSignError", text = " ",  num = "" },
    { name = "DiagnosticSignWarn",  text = " ",  num = "" },
    { name = "DiagnosticSignHint",  text = " ",  num = "" },
    { name = "DiagnosticSignInfo",  text = " ",  num = "" },
  }

  for _, sign in ipairs(signs_definition) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.num })
  end
end

return { setup = setup }
