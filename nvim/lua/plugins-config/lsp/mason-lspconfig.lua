local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local lspconfig_status_ok, lsp_config = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

mason_lspconfig.setup()
mason_lspconfig.setup_handlers {

  function (server_name)
    -- We are overriding the default Emmet server setup handler
    -- to have access to all html tags inside .ts and .js files
    if server_name == "emmet_ls" then
      lsp_config["emmet_ls"].setup {
        filetypes = {"html", "typescript", "javascript"},
        root_dir = lsp_config.util.find_git_ancestor,
        on_attach = require("plugins-config.lsp.handlers").on_attach,
        capabilities = require("plugins-config.lsp.handlers").capabilities,
      }
    else
      lsp_config[server_name].setup {
        on_attach = require("plugins-config.lsp.handlers").on_attach,
        capabilities = require("plugins-config.lsp.handlers").capabilities,
      }
    end

  end

}
