return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    { "hrsh7th/cmp-buffer", },
    { "hrsh7th/cmp-path", },
    { "hrsh7th/cmp-nvim-lua", },
    { "hrsh7th/cmp-nvim-lsp", },
    { "saadparwaiz1/cmp_luasnip", },
    { "hrsh7th/cmp-nvim-lsp-signature-help", },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#c678dd" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#fb4934" })
    vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#98c379" })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "buffer", keyword_lenght = 3 },
        { name = "nvim_lua" },
        { name = "cmp_tabnine" },
        { name = "path" },
      }),

      formatting = {
        format = function(entry, vim_item)
           -- load icons
           vim_item.kind = string.format(
              "%s %s",
              require("ui.icons")[vim_item.kind] or "",
              vim_item.kind
           )

           -- load source name in menu
           vim_item.menu = ({
              nvim_lsp = "[LSP]",
              nvim_lua = "[api]",
              buffer = "[buf]",
              luasnip = "[LuaSnip]",
              cmp_tabnine = "[TabNine]",
           })[entry.source.name]

           -- load return type from LSP
           local item = entry:get_completion_item()

           if item.detail then
             vim_item.menu = item.detail
           end

           return vim_item
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-l>"] = cmp.mapping.confirm({ select = false }),
        ["<C-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function()
          if cmp.visible() then
                  cmp.select_prev_item()
          end
        end, { "i", "s" }),
      }),

      experimental = {
        native_menu = false,
        ghost_text = true
      },
    })
  end
}
