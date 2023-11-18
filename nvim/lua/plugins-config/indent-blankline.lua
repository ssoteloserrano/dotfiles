local indent_blankline_status_ok, indent_blankline = pcall(require, "ibl")
if not indent_blankline_status_ok then
  return
end

indent_blankline.setup ({
    indent = {
        char = " ",
        highlight = { "LineNr" },
        smart_indent_cap = true,
        priority = 2,
    },
    whitespace = {
        highlight = { "Whitespace", "NonText" }
    },
    exclude = {
        filetypes = {
            "checkhealth",
            "help",
            "terminal",
            "markdown",
        },
        buftypes = {
            "terminal",
            "nofile",
        },
    },
    scope = {
        enabled = true,
        char = "▎",
        highlight = { "SpecialKey", "SpecialKey", "SpecialKey" },
        show_start = true,
        show_end = false,
        include = {
            node_type = {["*"] = {'*'}}
        },
    }
})
