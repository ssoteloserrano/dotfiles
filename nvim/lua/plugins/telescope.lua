return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "nvim-telescope/telescope-project.nvim",
    },
    config = function()
      local telescope, sorters, actions, previewers, builtin =
          require("telescope"),
          require("telescope.sorters"),
          require("telescope.actions"),
          require("telescope.previewers"),
          require("telescope.builtin")

      local rip_grep_config = {
        "rg",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      }

      telescope.setup {
        defaults = {
          prompt_position = "top",
          initial_mode = "insert",
          prompt_prefix = "  ",
          selection_caret = "❯ ",
          sorting_strategy = "ascending",
          color_devicons = true,
          file_sorter = sorters.get_fzy_sorter,
          generic_sorter = sorters.get_fzy_sorter,
          file_previewer = previewers.vim_buffer_cat.new,
          grep_previewer = previewers.vim_buffer_vimgrep.new,
          qflist_previewer = previewers.vim_buffer_qflist.new,
          vimgrep_arguments = rip_grep_config,
          mappings = {
            i = {
              ["<Leader>q"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous
            },
          },
          file_ignore_patterns = {
            ".git",
            "vendor",
            "node_modules",
            "__pycache__",
            ".pytest_cache",
          }
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            hidden = true,
            no_ignore = true,
          },
          buffers = {
            layout_config = { preview_width = 0.6 },
            ignore_current_buffer = true,
            sort_mru = true,
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
              },
              n = {
                ["<c-d>"] = actions.delete_buffer,
              },
            },
          },
          help_tags = {
            layout_config = { preview_width = 0.6 },
          },
          live_grep = {
            layout_config = { preview_width = 0.6 },
          },
          colorscheme = {
            enable_preview = true
          }
        },
        extensions = {
          fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
          },
        }
      }

      -- Load Telescope extensions
      telescope.load_extension("fzy_native")
      telescope.load_extension("file_browser")
      telescope.load_extension("project")
      telescope.load_extension("git_diffs")

      local find_files_from_root = function()
        local opts = {}
        opts.cwd = require("utils").get_project_root()
        builtin.find_files(opts)
      end

      local find_files_in_current_buffer = function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          winblend = 15,
          previewer = false,
        })
      end

      local find_string_in_open_buffers = function()
        builtin.live_grep({
          prompt_title = "find string in open buffers...",
          grep_open_files = true
        })
      end

      -- with builtin keymaps
      -- vim.keymap.set("n", "ff", find_files_from_root, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "ff", "<CMD>Telescope frecency workspace=CWD<CR>", { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<Leader>b", builtin.buffers, { desc = "[B]uffers" })
      vim.keymap.set("n", "<Leader>/", find_files_in_current_buffer, { desc = "[/] Fuzzily search in current buffer" })

      vim.keymap.set("n", "<Leader>r", builtin.oldfiles, { desc = "[R]ecently opened files" })
      vim.keymap.set("n", "<Leader>w", builtin.live_grep, { desc = "Find [W]ord" })
      vim.keymap.set("n", "<Leader>wo", find_string_in_open_buffers, { desc = "Find [W]ord in [O]pen Buffers" })
      vim.keymap.set("n", "<Leader>cs", builtin.colorscheme, { desc = "[C]olor [S]cheme" })
      vim.keymap.set("n", "<Leader>h", builtin.help_tags, { desc = "[H]elp Tags" })
      vim.keymap.set("n", "<Leader>c", builtin.registers)

      -- with plugin keymaps
      -- vim.keymap.set("n", "<Leader>p", ":lua require('telescope').extensions.project.project{}<CR>")
      vim.keymap.set("n", "dv", ":lua require('telescope').extensions.git_diffs.diff_commits()<CR>")
    end
  },
  {
    "paopaol/telescope-git-diffs.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    version = "*",
    config = function()
      require("telescope").setup {
        extensions = {
          frecency = {
            db_safe_mode = false,
            show_scores = true,
            show_filter_column = false
          }
        }
      }
      require("telescope").load_extension("frecency")
    end,
  },
}
