local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local function attach_navic_to_buffer(client, bufnr)
  vim.g.navic_silence = true
  navic.attach(client, bufnr)
end

return {
  attach_navic_to_buffer = attach_navic_to_buffer
}
