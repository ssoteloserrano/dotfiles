return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        stylua = {
          inherit = false,
          command = "/usr/bin/stylua",
          args = {
            "--indent-type",
            "Spaces",
          },
        },
        black = {
          prepend_args = {
            "--line-length",
            "79",
          },
        },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
