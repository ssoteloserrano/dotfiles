return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "bashls",
      "cucumber_language_server",
      "dockerls",
      "emmet_language_server",
      "eslint",
      "html",
      "intelephense",
      "jsonls",
      "lua_ls",
      "pylsp",
      "sqls",
      "texlab",
      "ts_ls",
      "yamlls",
      "vale_ls",
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
