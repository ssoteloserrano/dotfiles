return {
	"stevearc/conform.nvim",
	-- enabled = false,
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettier", stop_after_first = true },
			},
			formatters = {
				-- stylua = {
				--     prepend_args = {
				--         "--indent-type",
				--         "Spaces",
				--     },
				-- },
				black = {
					prepend_args = {
						"--line-length",
						"100",
					},
				},
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				-- Disable autoformat for specific file types (e.g., PHP)
				local filetype = vim.bo[bufnr].filetype
				if filetype == "php" then
					return
				end

				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		})

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
