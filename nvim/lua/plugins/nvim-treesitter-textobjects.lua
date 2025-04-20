return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
  requires = "nvim-treesitter/nvim-treesitter",
  config = function()
    local ts_textobjects = require("nvim-treesitter.configs")
    ts_textobjects.setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "outer function" },
            ["if"] = { query = "@function.inner", desc = "inner function" },

            ["ac"] = { query = "@class.outer", desc = "outer class" },
            ["ic"] = { query = "@class.inner", desc = "inner class" },

            ["aa"] = { query = "@assignment.outer", desc = "outer assignment" },
            ["ia"] = { query = "@assignment.inner", desc = "inner assignment" },

            -- In python this is return
            ["al"] = { query = "@call.outer", desc = "outer call" },
            ["il"] = { query = "@call.inner", desc = "inner call" },

            ["ao"] = { query = "@loop.outer", desc = "outer loop" },
            ["io"] = { query = "@loop.inner", desc = "inner loop" },

            ["ak"] = { query = "@block.outer", desc = "outer block" },
            ["ik"] = { query = "@block.inner", desc = "inner block" },


            ["ar"] = { query = "@parameter.outer", desc = "outer parameter" },
            ["ir"] = { query = "@parameter.inner", desc = "inner parameter" },

            ["ad"] = { query = "@conditional.outer", desc = "outer conditional" },
            ["id"] = { query = "@conditional.inner", desc = "inner conditional" },

            ["aq"] = { query = "@comment.outer", desc = "outer comment" },
            ["iq"] = { query = "@comment.inner", desc = "inner comment" },
          },
        },
      }
    })
  end
}
