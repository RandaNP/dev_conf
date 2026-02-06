return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
    "ravitemer/codecompanion-history.nvim",
    "lalitmee/codecompanion-spinners.nvim",
  },
  opts = {
    adapters = {
      http = {
        gemini__3_pro = function()
          return require("codecompanion.adapters").extend("gemini", {
            schema = {
              model = {
                default = "gemini-3-pro-preview",
              },
            },
          })
        end,
        gemini_3_flash = function()
          return require("codecompanion.adapters").extend("gemini", {
            schema = {
              model = {
                default = "gemini-3-flash-preview",
              },
            },
          })
        end,
        gemini__2_5_pro = function()
          return require("codecompanion.adapters").extend("gemini", {
            schema = {
              model = {
                default = "gemini-2.5-pro",
              },
            },
          })
        end,
        gemini_2_5_flash = function()
          return require("codecompanion.adapters").extend("gemini", {
            schema = {
              model = {
                default = "gemini-2.5-flash",
              },
            },
          })
        end,
        gemini_2_flash = function()
          return require("codecompanion.adapters").extend("gemini", {
            schema = {
              model = {
                default = "gemini-2.0-flash",
              },
            },
          })
        end,
        opts = {
          show_presets = false,
          show_model_choices = false,
        },
      },
      acp = {
        opts = {
          show_presets = false,
        },
      },
    },
    interactions = {
      cmd = {
        adapter = {
          name = "gemini",
          model = "gemini-2.0-flash",
        },
        -- adapter = {
        --   name = "ollama",
        --   model = "qwen3:4b-instruct",
        -- },
      },
      chat = {
        adapter = "gemini_2_flash",
        -- adapter = {
        --   name = "gemini",
        --   model = "gemini-2.0-flash",
        -- },
        -- adapter = {
        --   name = "ollama",
        --   model = "qwen3:4b-instruct",
        -- },
        roles = {
          ---The header name for the LLM's messages
          ---@type string|fun(adapter: CodeCompanion.Adapter): string
          llm = function(adapter)
            return "CodeCompanion (" .. adapter.formatted_name .. " " .. adapter.model.name .. ")"
          end,
        },
        variables = {
          ["buffer"] = {
            opts = {
              -- Always sync the buffer by sharing its "diff"
              -- Or choose "all" to share the entire buffer
              default_params = "diff",
            },
          },
        },
      },
      inline = {
        adapter = {
          name = "gemini",
          model = "gemini-2.0-flash-lite",
        },
        -- adapter = {
        --   name = "ollama",
        --   model = "qwen3:4b-instruct",
        -- },
      },
    },
    extensions = {
      spinner = {
        -- enabled = true, -- This is the default
        opts = {
          -- Your spinner configuration goes here
          style = "noice", -- "snacks", "noice"
        },
      },
      history = {
        enabled = true,
        opts = {
          -- Keymap to open history from chat buffer (default: gh)
          keymap = "gh",
          -- Keymap to save the current chat manually (when auto_save is disabled)
          save_chat_keymap = "cc",
          -- Save all chats by default (disable to save only manually using 'sc')
          auto_save = false,
          -- Number of days after which chats are automatically deleted (0 to disable)
          expiration_days = 0,
          -- Picker interface (auto resolved to a valid picker)
          picker = "fzf-lua", --- ("telescope", "snacks", "fzf-lua", or "default")
          ---Optional filter function to control which chats are shown when browsing
          chat_filter = nil, -- function(chat_data) return boolean end
          -- Customize picker keymaps (optional)
          picker_keymaps = {
            rename = { n = "r", i = "<C-r>" },
            delete = { n = "d", i = "<C-d>" },
            duplicate = { n = "<C-y>", i = "<C-y>" },
          },
          ---Automatically generate titles for new chats
          auto_generate_title = true,
          title_generation_opts = {
            ---Adapter for generating titles (defaults to current chat adapter)
            adapter = {
              name = "gemini", -- ollama", -- "copilot"
              ---Model for generating titles (defaults to current chat model)
              model = "gemini-2.0-flash-lite", -- qwen3:4b-instruct", -- "gpt-4o"
              opts = {
                thinkingConfig = {
                  thinkingBudget = 0,
                },
              },
            },
            ---Number of user prompts after which to refresh the title (0 to disable)
            refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
            ---Maximum number of times to refresh the title (default: 3)
            max_refreshes = 3,
            format_title = function(original_title)
              -- this can be a custom function that applies some custom
              -- formatting to the title.
              return original_title
            end,
          },
          ---On exiting and entering neovim, loads the last chat on opening chat
          continue_last_chat = false,
          ---When chat is cleared with `gx` delete the chat from history
          delete_on_clearing_chat = false,
          ---Directory path to save the chats
          dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          ---Enable detailed logging for history extension
          enable_logging = false,

          -- Summary system
          summary = {
            -- Keymap to generate summary for current chat (default: "gcs")
            create_summary_keymap = "cs",
            -- Keymap to browse summaries (default: "gbs")
            browse_summaries_keymap = "gbs",

            generation_opts = {
              adapter = {
                name = "gemini", -- ollama", -- "copilot"
                ---Model for generating titles (defaults to current chat model)
                model = "gemini-2.0-flash-lite", -- qwen3:4b-instruct", -- "gpt-4o"
                opts = {
                  thinkingConfig = {
                    thinkingBudget = 0,
                  },
                },
              },
              context_size = 1048576, -- 32000, -- 4000000, -- max tokens that the model supports
              include_references = true, -- include slash command content
              include_tool_outputs = true, -- include tool execution results
              system_prompt = nil, -- custom system prompt (string or function)
              format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
            },
          },

          -- Memory system (requires VectorCode CLI)
          -- rules = {
          --   -- Automatically index summaries when they are generated
          --   auto_create_memories_on_summary_generation = true,
          --   -- Path to the VectorCode executable
          --   vectorcode_exe = "vectorcode",
          --   -- Tool configuration
          --   tool_opts = {
          --     -- Default number of memories to retrieve
          --     default_num = 10
          --   },
          --   -- Enable notifications for indexing progress
          --   notify = true,
          --   -- Index all existing memories on startup
          --   -- (requires VectorCode 0.6.12+ for efficient incremental indexing)
          --   index_on_startup = false,
          -- },
        },
      },
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
    -- Keymap
    local map = vim.keymap.set
    map(
      "n",
      "<leader>ac",
      "<CMD>CodeCompanionChat Toggle<CR>",
      { desc = "AI: toggle chat or open standard chat", noremap = true, silent = true }
    )
    map(
      "n",
      "<leader>aC",
      "<CMD>CodeCompanionChat adapter=gemini model=gemini-3-flash-preview<CR>",
      { desc = "AI: open gemini-3 chat", noremap = true, silent = true }
    )
    map("n", "<leader>aa", "<CMD>CodeCompanionActions<CR>", { desc = "AI: actions", noremap = true, silent = true })
    map(
      "n",
      "<leader>ah",
      "<CMD>CodeCompanionHistory<CR>",
      { desc = "AI: chat history", noremap = true, silent = true }
    )

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
}
