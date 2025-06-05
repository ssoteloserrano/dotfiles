return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys",   gap = 1, padding = 1 },
        { section = "startup" },
        {
          section = "terminal",
          cmd = "ascii-image-converter /home/scar/dev/personal/crafted_insights/logo/white/logo.png -C -c",
          random = 10,
          pane = 2,
          indent = 4,
          height = 30
        }
      }
    },
    notifier = { enabled = true },
    bufdelete = { enabled = true },
    input = { enabled = true },

    -- explorer = { enabled = true },
    -- indent = { enabled = true },
    -- picker = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
}
