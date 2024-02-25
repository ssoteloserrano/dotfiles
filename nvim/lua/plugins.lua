local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "nvim-lua/plenary.nvim", -- For neovim plugins dev
  --
  -- Colorschemes
  "sainnhe/gruvbox-material",
  "Shatur/neovim-ayu",
  -- with transparent options
  { "catppuccin/nvim",        name = "catppuccin" },
  "sainnhe/everforest",
  { "EdenEast/nightfox.nvim", version = "v1.0.0" },
  "tiagovla/tokyodark.nvim",
  "navarasu/onedark.nvim",
  "eddyekofo94/gruvbox-flat.nvim",
  "folke/tokyonight.nvim",
  "rebelot/kanagawa.nvim",

  {
    "nvim-neorg/neorg",
    after = "nvim-treesitter",
    config = function()
      require("plugins-config.norg")
    end,
    build = ":Neorg sync-parsers",
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- Language highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },

  -- Icons
  {
    "kyazdani42/nvim-web-devicons",
    dependencies = {
      -- Buffers navigation and tabline
      { "akinsho/bufferline.nvim", version = "v3.*" }
    }
  },

  "tzachar/local-highlight.nvim",

  -- Lualine for statusline
  "nvim-lualine/lualine.nvim",

  -- Indentation guides
  "lukas-reineke/indent-blankline.nvim",

  -- File search and much more
  "junegunn/fzf",
  build = "fzf#install()",

  -- File explorer within nvim
  "kyazdani42/nvim-tree.lua",

  -- Commenter
  "terrortylor/nvim-comment",

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  -- Completion
  {
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
  },

  "hrsh7th/cmp-nvim-lsp",

  -- Insert parents, quotes and brackets in pair
  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins-config.autopairs")
    end,
  },

  -- git
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins-config.gitsigns")
    end,
  },

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
      require("plugins-config.telescope")
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  {
    "paopaol/telescope-git-diffs.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },

  -- Pretty notifications
  "rcarriga/nvim-notify",

  "norcalli/nvim-colorizer.lua",

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      require("plugins-config.markdown")
    end,
  },

  "mg979/vim-visual-multi",

  -- For laravel
  "jwalton512/vim-blade",

  { "akinsho/toggleterm.nvim", version = "*" },

  "gelguy/wilder.nvim",

  -- used for winbar
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig"
  },

  "f-person/git-blame.nvim",

  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      require("plugins-config.windows")
    end
  },

  "lervag/vimtex",

  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" }
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "LazyFile",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },

  -- Active indent guide and indent text objects. When you're browsing
  -- code, this highlights the current level of indentation, and animates
  -- the highlighting.
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      }
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
  }
}

require("lazy").setup(plugins)
