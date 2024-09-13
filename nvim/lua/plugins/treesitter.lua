return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
    ts_update()
  end,
  config = function ()
    local ensure_installed = {
      "c",
      "cpp",
      "gitignore",
      "fish",
      "lua",
      "vim",
      "python",
      "javascript",
      "vue",
      "css",
      "html",
      "json",
      "markdown",
      "markdown_inline",
      "regex",
      "vim",
      "yaml",
      "php",
      "latex",
      "org",
      "norg",
      "dockerfile",
    }

    require("nvim-treesitter.configs").setup({
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
      compilers_install.compilers = { "clang", "gcc", "clangd" }
    end
  end
}
