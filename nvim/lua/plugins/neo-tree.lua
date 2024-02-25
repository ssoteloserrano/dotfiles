return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        name = "window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { "neo-tree", "neo-tree-popup", "notify" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { "terminal", "quickfix" },
              },
            },
            other_win_hl_color = "#e35e4f",
          })
        end,
      }
    },
    config = function ()
      require("neo-tree").setup({
        filesystem = {
          window = {
            mappings = {
              ["l"] = "open_with_window_picker",
              ["v"] = "open_vsplit",
              ["o"] = "system_open",
            }
          },
          commands = {
            system_open = function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              -- Linux: open file in default application
              vim.fn.jobstart({ "xdg-open", path }, { detach = true })
            end,
          },
        },
        event_handlers = {
          {
            event = "file_opened",
            handler = function(file_path)
              require("neo-tree.command").execute({ action = "close" })
            end
          },
        }
      })

      local options = { noremap = true, silent = true }
      vim.keymap.set("n", "<Leader>n", ":Neotree toggle filesystem reveal right<CR>", options)
    end
}
