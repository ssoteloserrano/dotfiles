return {
	"rcarriga/nvim-notify",
	enabled = false,
	config = function()
		local notify = require("notify")

		notify.setup({
			fps = 60,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 50,
			-- render = "default",
			render = "wrapped-compact",
			stages = "fade_in_slide_out",
			timeout = 30,
			top_down = true,
			background_colour = "#000000",
			max_width = 80,
			on_open = function(win)
				vim.api.nvim_set_option_value("wrap", true, { win = win })
			end,
		})

		vim.api.nvim_set_keymap("n", "<leader>p", "", { callback = notify.dismiss })
	end,
	-- }
	-- local notify = require("notify")
	-- vim.notify = notify
	-- notify.setup {
	--   background_colour = "#000000",
	--   fps = 60,
	--   icons = {
	--     DEBUG = "",
	--     ERROR = "",
	--     INFO = "",
	--     TRACE = "✎",
	--     WARN = ""
	--   },
	--   level = 2,
	--   minimum_width = 50,
	--   render = "default",
	--   stages = "fade_in_slide_out",
	--   timeout = 30,
	--   top_down = true
	-- }
	-- end
}
