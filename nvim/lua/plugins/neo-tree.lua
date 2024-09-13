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
        opts = {},
      }
    },
    config = function ()
      local icons = require("ui.icons")
      require("neo-tree").setup({
        log_level = "warn",
        enable_diagnostics = false,
        filesystem = {
          filtered_items = {
            always_show = {
              ".gitignore",
              ".env",
              ".env.prod",
              ".env.stage",
              ".env.example",
              ".dockerignore",
              ".gcloudignore",
            },
          },
          window = {
            position = "right",
            mappings = {
              ["l"] = "open_with_window_picker",
              ["v"] = "open_vsplit",
              ["h"] = "open_split",
              ["o"] = "system_open",
              ["P"] = { "toggle_preview", config = { use_float = true } },
            }
          },
          commands = {
            system_open = function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.jobstart({ "nemo", path }, { detach = true })
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
        },
        default_component_configs = {
          git_status = {
            symbols = {
              -- Change type
              added     = icons["GitAddedNeoTree"],
              modified  = icons["Circle"],
              deleted   = icons["GitDeletedNeoTree"],
              renamed   = icons["GitRenamedNeoTree"],
              -- Status type
              untracked = icons["GitUntrackedNeoTree"],
              ignored   = icons["GitIgnoredNeoTree"],
              unstaged  = icons["GitUnstagedNeoTree"],
              staged    = icons["GitStagedNeoTree"],
              conflict  = icons["GitConflict"],
            }
          },

        }
      })

      local options = { noremap = true, silent = true }
      vim.keymap.set("n", "<Leader>n", ":Neotree toggle filesystem reveal<CR>", options)
    end
}
