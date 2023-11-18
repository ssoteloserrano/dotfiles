local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

local ensure_installed = { "c", "gitignore", "fish", "lua", "vim", "python", "javascript", "vue", "css", "html", "json", "markdown",
    "regex", "vim", "yaml", "php", "latex", "org", "norg" }

treesitter.setup({
    ensure_installed = ensure_installed,
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = { enable = false },
    autopairs = { enable = true },
    autotag = { enable = true },
})

local status_ok, compilers_install = pcall(require, "nvim-treesitter.install")
if status_ok then
  compilers_install.prefer_git = false
  compilers_install.compilers = { "clang", "gcc" }
end

-- vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
--     group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
--     callback = function()
--       vim.opt.foldmethod = "expr"
--       vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
--       vim.o.foldenable   = false -- Disable folding at startup
--     end
-- })
