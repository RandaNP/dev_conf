return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "python",
        "typescript",
        "javascript",
        "json",
        "yaml",
        "css",
        "bash",
        "dockerfile",
        "gitignore",
        "html",
        "query",
        "markdown",
        "markdown_inline",
        "vimdoc",
      },
      highlight = { enable = true },
      indent = { enable = true, disable = { "python" } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<c-backspace>",
        },
      },
    })
  end,
}
