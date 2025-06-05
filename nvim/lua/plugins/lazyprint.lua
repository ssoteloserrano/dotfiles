return {
	"scarktt/lazyprint",
	dir = "/home/scar/dev/personal/lua/plugins/lazyprint",
	config = function()
		require("lazyprint").setup({
			yank_mapping = "<leader>cp",
			lang = {
				lua = "print('$var: ' .. require('utils').dump($var))",
        php = "dd($$var);",
			},
      multi_variable = {
        yank_multi_mapping = "<leader>cm",
        delete_multi_mapping = "<leader>;",
        separator = ",",
      },
			special_formats = {
				-- type
				["<leader>ct"] = {
					py = "print('type of $var: ', type($var))",
					lua = "print('$var: ' .. type($var))",
					php = "echo 'type of $var is: ', gettype($$var);",
				},
        -- pretty print
				["<leader>cpp"] = {
					php = "dd(json_encode($$var, JSON_PRETTY_PRINT));",
				},
				-- logging
				["<leader>cli"] = {
            py = [[logger.info({
              "$var": $var,
              "message": f""
            })]]
        },
			},
		})
	end,
}
