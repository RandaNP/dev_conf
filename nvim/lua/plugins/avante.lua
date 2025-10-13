-- local prefix = "<Leader>a"
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  -- version = false, -- Never set this value to "*"! Never!
  -- commit = "6bfd792",
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- mappings = {
    --   chat = prefix .. "c",
    -- },
    provider = "gemini",
    -- default_provider = "gemini",
    system_prompt = "you are an expert in coding, networking and system integration and answer in concise way",
    providers = {
      gemini = {
        -- endpoint = "https://api.openai.com/v1",
        -- model = "gemini-2.0-flash", -- your desired model (or use gpt-4o, etc.)
        model = "gemini-2.0-flash", -- your desired model (or use gpt-4o, etc.)
        -- timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
        -- context_window = 250000,
        extra_request_body = {
          generationConfig = {
            temperature = 0,
          },
          -- temperature = 0,
          -- max_tokens = 4096,
          -- max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
          --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
        },
      },
      behaviour = {
        auto_suggestion = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        jump_result_buffer_on_finish = true,
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
    -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    -- "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  --
  -- customizations
  selector = {
    --- @alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
    --- @type avante.SelectorProvider
    provider = "fzf",
    -- Options override for custom providers
    provider_opts = {},
  },
  input = {
    provider = "snacks",
    provider_opts = {
      -- Additional snacks.input options
      title = "Avante Input",
      icon = " ",
    },
  },
}
