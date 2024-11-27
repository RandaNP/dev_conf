return {
  {
    "tpope/vim-fugitive",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local neogit = require("neogit")
      neogit.setup()

      vim.keymap.set("n", "<leader>gS", neogit.open, {
        desc = "Neo[g]it [S]tatus",
        silent = true,
        noremap = true,
      })
      vim.keymap.set("n", "<leader>gC", ":Neogit commit<CR>", {
        desc = "Neo[g]it [C]ommit",
        silent = true,
        noremap = true,
      })
      vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", {
        desc = "Neo[g]it [p]ull",
        silent = true,
        noremap = true,
      })
      vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", {
        desc = "Neo[g]it [P]ush",
        silent = true,
        noremap = true,
      })
      vim.keymap.set("n", "<leader>gtb", ":Telescope git_branches<CR>", {
        desc = "[g]it [t]elescope [b]ranches",
        silent = true,
        noremap = true,
      })
      -- 		vim.keymap.set("n", "<leader>gB", ":G blame<CR>", {
      -- 			desc = "[G]it [B]lame",
      -- 			silent = true,
      -- 			noremap = true,
      -- 		})
    end,
  },
  -- {
  -- 	"lewis6991/gitsigns.nvim",
  -- 	config = function()
  -- 		require("gitsigns").setup()
  --
  -- 		vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "[G]it [P]review" })
  -- 	end,
  -- },
}
