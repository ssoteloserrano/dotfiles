return {
  "tzachar/local-highlight.nvim",
  config = function ()
    local local_highlight = require("local-highlight")
    local_highlight.setup({
        hlgroup = "Search",
        cw_hlgroup = nil,
        animate = {
          enabled = false,
        },
    })

    vim.api.nvim_create_autocmd("BufRead", {
      pattern = {"*.*"},
      callback = function(data)
        local_highlight.attach(data.buf)
      end
    })
  end
}
