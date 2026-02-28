return {
  {
    "andythigpen/nvim-coverage",
    version = "*",
    config = function()
      require("coverage").setup({
        auto_reload = true,
      })
    end,
    keys = {
      {
        "<leader>tc",
        "",
        desc = "Test coverage",
      },
      {
        "<leader>tcr",
        function()
          require("neotest").run.run({ extra_args = { "--cov=src" } })
        end,
        desc = "Coverage run nearest test",
      },
      {
        "<leader>tcR",
        function()
          require("neotest").run.run({ vim.uv.cwd(), extra_args = { "--cov=src" } })
        end,
        desc = "Coverage run all tests",
      },
      {
        "<leader>tcl",
        function()
          require("coverage").load(true)
        end,
        desc = "Coverage show",
      },
      {
        "<leader>tch",
        function()
          require("coverage").clear()
        end,
        desc = "Coverage hide",
      },
      {
        "<leader>tcs",
        function()
          require("coverage").summary()
        end,
        desc = "Coverage summary",
      },
      {
        "<leader>tcn",
        function()
          require("coverage").jump_next("uncovered")
        end,
        desc = "Next uncovered",
      },
      {
        "<leader>tcN",
        function()
          require("coverage").jump_next("partial")
        end,
        desc = "Next partial covered",
      },
      {
        "<leader>tcp",
        function()
          require("coverage").jump_prev("uncovered")
        end,
        desc = "Prev uncovered",
      },
      {
        "<leader>tcP",
        function()
          require("coverage").jump_next("partial")
        end,
        desc = "Prev partial covered",
      },
    },
  },
}
