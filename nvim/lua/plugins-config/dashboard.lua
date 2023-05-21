local is_ok, dashboard = pcall(require, "dashboard")
if not is_ok then
  return
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>gh", "<CMD>Dashboard<CR>", opts)

local home = os.getenv("HOME")

if home == nil then
  home = "~"
end

dashboard.preview_file_path = home .. "/.config/nvim/static/neovim.cat"
dashboard.preview_file_height = 11
dashboard.preview_file_width = 70
-- dashboard.hide_tabline = false
dashboard.custom_center = {
  {icon = "   ",
  desc = "Recently latest session                 ",
  shortcut = "SPC s l",
  action ="SessionLoad"},
  -- {icon = "  ",
  -- desc = "Recently opened files                   ",
  -- action =  "DashboardFindHistory",
  -- shortcut = "SPC f h"},
  {icon = "  ",
  desc = "Find  File                              ",
  action = "Telescope find_files find_command=rg,--hidden,--files",
  shortcut = "SPC f f"},
  {icon = "  ",
  desc ="File Browser                            ",
  action =  "Telescope file_browser",
  shortcut = "SPC f b"},
  {icon = "  ",
  desc = "Find  word                              ",
  action = "Telescope live_grep",
  shortcut = "SPC f w"},
  {icon = "   ",
  desc = "Open dotfiles                           ",
  action = "e " .. home .."./AppData/Local/nvim/init.lua",
  shortcut = "SPC f d"},
}

dashboard.custom_header = {
[[⢸⣷⣦⣀⠉⠚⢿⣾⣿⣿⣿⣿⣿⣦⠄⣿⣿⣧⠹⡌⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⠈⠳⡇⠯⠄⠈⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠰⣛⣾⣁⠄⠄⠄]],
[[⢸⣿⣿⣿⣷⣤⣜⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣆⠃⢣⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢐⣋⣷⡛⠄⢀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣀⡭⠷⠄]],
[[⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢸⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⣏⠁⠄⢠⣴⠟⠁⠄⠄⢀⡀⠄⠄⠄⠄⠄⢀⡀⠄⠄⠄⠄⠄⠄⠄⠄⠈⠳⡄]],
[[⢰⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡟⢟⢇⢸⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠲⣾⠵⠐⢁⡇⠄⢀⠄⡆⢰⠙⢦⡀⠄⠄⠄⢢⠱⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⡀]],
[[⢰⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⡛⠋⠁⠄⠒⠎⢸⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢨⠟⡀⣿⣳⡦⢰⢧⢹⣾⢣⣄⠱⣎⢲⡀⠈⢣⢳⡢⡀⠄⠄⠄⠄⠠⡘⠫⠅]],
[[⢸⣿⣿⣿⣿⣿⣿⣿⡏⢊⠵⡼⠋⠁⠄⠄⠄⡐⢒⡴⢸⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⡯⢚⠄⠈⢻⢇⠈⢿⣿⡟⠛⡟⠓⢿⢆⢿⣄⢸⠻⡎⢱⠄⠄⠄⠄⡀⠹⡍⠁]],
[[⠸⢿⣿⣿⣿⣿⣿⣿⣇⢤⠐⠄⠄⠄⠄⠄⠄⠄⡾⢰⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠄⣼⣠⡤⡎⣏⢢⣘⣟⢿⢠⠄⠄⠄⠈⠏⠘⣿⡤⢆⠏⠄⠄⠄⢀⢯⣳⢽⠄]],
[[⠈⠙⠿⣿⣿⣿⣿⣿⡿⠉⠢⠄⠄⠄⠄⠄⠄⠄⠄⠘⠢⢤⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢳⣯⡮⠝⠁⠄⠉⠄⠄⠄⠄⠄⠄⢰⠉⣇⡆⠄⠄⠄⢠⡄⠄⠄⠄]],
[[⠄⠄⠄⠈⠻⣿⠟⠋⠄⠄⠄⡀⠄⠄⠄⠄⠄⣰⢤⡀⡠⠊⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠉⠳⣄⠄⠄⡠⠄⠄⠄⠄⠄⠄⡘⠄⠙⢳⣦⣴⣶⣾⠃⠄⠄⠄]],
[[⠄⠄⠄⠄⡴⠁⠄⠄⠄⠄⠄⠐⡀⠄⠄⠄⠄⡟⠉⠑⠁⠄⠄⠄⠄⠄⡔⢹⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⠒⣎⠄⠄⠄⠄⠄⣠⠞⠁⣠⣾⣿⣿⣿⣿⣿⠴⠒⠒⠂]],
[[⢀⠮⠄⠄⡠⠚⠓⠒⠤⡀⠄⢀⢄⡑⠄⠄⠄⡱⠄⠄⠄⠄⠄⠄⡰⠃⢠⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⢣⡀⢀⣰⠵⠒⢢⣾⣿⣿⣿⣿⠿⠟⠁⠄⠄⠄⠄]],
[[⠄⠄⠄⡠⠄⠄⠄⠄⠄⠈⣦⠂⠄⠈⠑⠒⠊⠄⢿⠕⠄⠄⢀⡜⠁⡠⠃⠄⠄⠄⠄⠄⠄⢀⡤⡀⠄⠄⠄⠄⠄⠄⠄⠄⠉⠁⠄⠄⠄⢿⣿⣿⣿⣿⡏⠄⠄⠄⠄⠄⠄⠄]],
[[⠄⣀⠜⠁⠄⠄⠄⠄⠄⠄⢸⠄⠄⠄⠄⠄⠄⠄⠄⡇⠘⠤⠊⠄⠄⠛⢽⠄⠄⠄⠄⠄⠄⠈⠧⠑⢄⠄⠄⠄⠄⣀⠄⠄⠄⠄⠄⠄⠄⣀⢼⣿⣿⡿⠄⠄⠄⠄⠄⠄⠄⠄]],
[[⠄⢹⠄⠄⠄⠄⠄⠄⠄⠄⢸⠄⠄⠄⠄⠄⠄⠄⠄⡇⠄⠄⠄⠄⠄⠄⠈⡃⠄⠄⠄⠄⠄⠄⠄⢣⠄⢣⡀⠄⡎⢨⠃⠄⠄⠄⠄⢀⡾⠁⢸⣿⣿⡇⠄⠄⠄⠘⡀⠄⢠⡀]],
[[⠄⠈⡇⠈⠄⠄⠄⠄⠄⠄⢸⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠃⠄⠄⠄⠄⠄⠄⠄⣉⠑⢦⡈⠢⠇⢸⠄⠄⠄⠄⠄⣼⠄⠄⠸⣿⣿⠄⠄⠄⠱⣄⠙⢦⡀⠁]],
[[⠄⠄⠘⢤⣇⠄⠄⠄⠄⠄⠈⡇⠄⠄⠄⠄⠄⠄⠄⠘⠄⠄⠄⠄⢀⠤⠚⠄⠄⠄⠄⠄⠄⠄⢰⢬⡓⣦⢷⠊⠄⠈⠇⠄⠄⠄⠄⡟⠰⣰⠄⠛⠃⠄⠄⠄⠄⠄⠓⠠⠭⠆]],
[[⠄⠄⠄⢀⢽⠄⠄⠄⠄⠄⠄⢀⠄⠄⠄⠄⠄⠄⢠⠃⠄⠄⠄⢠⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⢸⢤⣩⡏⢸⠄⠄⠄⡄⠄⠄⠄⢠⡇⠄⢿⡄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄]],
[[]],
}

