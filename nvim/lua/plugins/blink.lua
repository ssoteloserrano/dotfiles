return {
  {
    "saghen/blink.cmp",
    enabled = true,
    dependencies = {
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      "rafamadriz/friendly-snippets",
      "Kaiser-Yang/blink-cmp-avante",
    },
    version = "*",
    config = function()
      require("blink.cmp").setup({
        snippets = { preset = "luasnip" },
        signature = { enabled = true },
        appearance = {
          use_nvim_cmp_as_default = false,
          nerd_font_variant = "normal",
        },
        sources = {
          default = { "avante", "lsp", "path", "snippets", "buffer" },
          providers = {
            cmdline = {
              min_keyword_length = 2,
            },
            avante = {
              module = 'blink-cmp-avante',
              name = 'Avante',
              opts = {
              }
            }
          },
        },
        -- All the available commands here: https://cmp.saghen.dev/configuration/keymap.html#commands
        keymap = {
          ["<C-f>"] = {},
          ["<C-l>"] = { "accept", "fallback" },
          ["<C-k>"] = { "select_prev", "fallback" },
          ["<C-j>"] = { "select_next", "fallback" },
          ["<C-Space>"] = { "show", "fallback" },
        },
        cmdline = {
          enabled = false,
          completion = { menu = { auto_show = true } },
          keymap = {
            ["<CR>"] = { "accept_and_enter", "fallback" },
          },
        },
        completion = {
          menu = {
            border = nil,
            scrolloff = 1,
            scrollbar = false,
            draw = {
              columns = {
                { "kind_icon" },
                { "label",      "label_description", gap = 1 },
                { "kind" },
                { "source_name" },
              },
            },
          },
          documentation = {
            window = {
              border = nil,
              scrollbar = false,
              winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
            },
            auto_show = true,
            auto_show_delay_ms = 500,
          },
        },
      })

      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
