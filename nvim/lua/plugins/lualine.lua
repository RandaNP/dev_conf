return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "franco-ruggeri/codecompanion-lualine.nvim",
    -- Other dependencies
  },
  opts = {
    sections = {
      lualine_x = {
        "codecompanion",
        -- Other components
      },
    },
  },
}
