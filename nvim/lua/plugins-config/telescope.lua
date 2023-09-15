local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

local sorters, actions, previewers, builtin = require("telescope.sorters"), require("telescope.actions"),
    require("telescope.previewers"), require("telescope.builtin")

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
      layout_config = { preview_width = 0.5 },
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
vim.keymap.set("n", "ff", find_files_from_root, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<Leader>b", builtin.buffers, { desc = "[B]uffers" })
vim.keymap.set("n", "<Leader>/", find_files_in_current_buffer, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<Leader>r", builtin.oldfiles, { desc = "[R]ecently opened files" })
vim.keymap.set("n", "<Leader>w", builtin.live_grep, { desc = "Find [W]ord" })
vim.keymap.set("n", "<Leader>wo", find_string_in_open_buffers, { desc = "Find [W]ord in [O]pen Buffers" })
vim.keymap.set("n", "<Leader>cs", builtin.colorscheme, { desc = "[C]olor [S]cheme" })
vim.keymap.set("n", "<Leader>c", builtin.registers)

-- with plugin keymaps 
vim.keymap.set("n", "<Leader>p", ":lua require('telescope').extensions.project.project{}<CR>")
vim.keymap.set("n", "dv", ":lua require('telescope').extensions.git_diffs.diff_commits()<CR>")
