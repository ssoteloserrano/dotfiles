require("options")
require("keymaps")
require("globals")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("autocmds")
require("own")
require("lazy").setup("plugins")
-- require("lazy").setup({
-- {
--   "kyazdani42/nvim-web-devicons",
-- },
-- {
--   "ThePrimeagen/refactoring.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-treesitter/nvim-treesitter",
--   },
--   lazy = false,
--   config = function()
--     require("refactoring").setup({
--       show_success_message = true,
--     })

--     vim.keymap.set("x", "<leader>re", ":Refactor extract ")
--     vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

--     vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

--     vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

--     vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func")

--     vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
--     vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

--   end,
-- }})
