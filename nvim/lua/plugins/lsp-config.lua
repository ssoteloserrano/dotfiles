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
        ensure_installed = { "ts_ls", "dockerls", "lua_ls", "eslint", "bashls", "pylsp", "html", "intelephense", "gopls", "texlab", "jsonls", "emmet_language_server", "cucumber_language_server" },
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
          elseif server_name == "pylsp" then
            lsp_config["pylsp"].setup {
              on_attach = require("plugins.lsp.lsp-handlers").on_attach,
              capabilities = require("plugins.lsp.lsp-handlers").capabilities,
              settings = {
                pylsp = {
                  plugins = {
                    -- formatter options
                    black = { enabled = true },
                    autopep8 = { enabled = false },
                    yapf = { enabled = false },
                    -- linter options
                    -- pylint = { enabled = true, executable = "pylint" },
                    pyflakes = { enabled = true },
                    -- pycodestyle = { enabled = true },
                    -- type checker
                    pylsp_mypy = { enabled = true },
                    -- auto-completion options
                    jedi_completion = { fuzzy = true },
                    -- import sorting
                    pyls_isort = { enabled = true },
                  },
                },
              },
              flags = {
                debounce_text_changes = 200,
              },
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
      vim.cmd [[
        autocmd BufRead,BufNewFile .env* set filetype=sh
      ]]
    end
  },
}
