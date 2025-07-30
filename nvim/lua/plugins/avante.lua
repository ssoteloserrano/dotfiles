return {
  {
    "yetone/avante.nvim",
    enabled = true,
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    build = "make",
    opts = {
      provider = "llama_3_1_nemotron",
      providers = {
        gemini = {
          model = "gemini-2.5-flash-preview-04-17",
        },
        gemini_2_5_flash = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "google/gemini-2.5-flash",
          disable_tools = true,
        },
        deepseek_r1_0528 = {
          -- LLM base: DeepSeek Coder
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "deepseek/deepseek-r1-0528:free",
          extra_request_body = {
            temperature = 0.7,
            max_tokens = 1000,
            reasoning_effort = "low",
          },
          disable_tools = true,
        },
        deepseek_r1_0528_qwen3 = {
          -- LLM base: Qwen3-8B (generalista)
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "deepseek/deepseek-r1-0528-qwen3-8b:free",
          extra_request_body = {
            temperature = 0.7,
            max_tokens = 1000,
            reasoning_effort = "low",
          },
          disable_tools = true,
        },
        llama_3_1_nemotron = {
          -- LLM base: Meta's Llama-3.3
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "nvidia/llama-3.1-nemotron-ultra-253b-v1:free",
          extra_request_body = {
            temperature = 0.7,
            reasoning_effort = "low",
          },
          disable_tools = true,
        },
        openrouter_devstral_small_2505 = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "mistralai/devstral-small-2505:free",
          extra_request_body = {
            temperature = 0.7,
            reasoning_effort = "low",
          },
          disabled_tools = { "attempt_completion" },
        },
        openrouter_mistral_small_3_2 = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "mistralai/mistral-small-3.2-24b-instruct:free",
          disabled_tools = { "attempt_completion" },
        },
        openrouter_cloude_sonet_4 = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "anthropic/claude-sonnet-4",
          disabled_tools = true,
        },
      },
      behaviour = {
        enable_cursor_planning_mode = true,
        support_paste_from_clipboard = true,
        auto_suggestions = false,
      },
      mappings = {
        ask = "<leader>aa",
        edit = "<leader>ae",
        refresh = "<leader>ar",
        clear = "<leader>ac",
        stop = "<leader>as",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "echasnovski/mini.icons", -- or echasnovski/mini.icons
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
