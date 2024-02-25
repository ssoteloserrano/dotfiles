return {
  {
    "williamboman/mason.nvim",
    config = function ()
      local icons = require("ui.icons")
      require("mason").setup({
        ui = {
          icons = {
            package_installed = icons.GitStaged,
            package_pending = icons.GitRenamed,
            package_uninstalled = icons.GitUnstaged
          }
        }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
      local lsp_config = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup {
        ensure_installed = { "tsserver", "dockerls", "lua_ls", "eslint", "bashls", "pylsp", "html", "intelephense", "gopls", "texlab", "jsonls", "emmet_language_server" },
      }
      mason_lspconfig.setup_handlers {
        function (server_name)
          -- We are overriding the default Emmet server setup handler
          -- to have access to all html tags inside .ts and .js files
          if server_name == "emmet_language_server" then
            lsp_config["emmet_language_server"].setup {
              filetypes = {"html", "typescript", "javascript"},
              root_dir = lsp_config.util.find_git_ancestor,
              on_attach = require("plugins.lsp.lsp-handlers").on_attach,
              capabilities = require("plugins.lsp.lsp-handlers").capabilities,
            }
          else
            lsp_config[server_name].setup {
              on_attach = require("plugins.lsp.lsp-handlers").on_attach,
              capabilities = require("plugins.lsp.lsp-handlers").capabilities,
            }
          end
        end
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      local diagnostic_config = require("plugins.lsp.diagnostic.diagnostic")
      require("plugins.lsp.lsp-handlers").setup(diagnostic_config)
      vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    end
  },
}
