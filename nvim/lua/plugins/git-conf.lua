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

			vim.keymap.set("n", "<leader>gs", neogit.open, {
				desc = "[G]it [s]tatus",
				silent = true,
				noremap = true,
			})
			vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", {
				desc = "[G]it [c]ommit",
				silent = true,
				noremap = true,
			})
			vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", {
				desc = "[G]it [p]ull",
				silent = true,
				noremap = true,
			})
			vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", {
				desc = "[G]it [P]ush",
				silent = true,
				noremap = true,
			})
			vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", {
				desc = "[G]it [b]ranches",
				silent = true,
				noremap = true,
			})
			vim.keymap.set("n", "<leader>gB", ":G blame<CR>", {
				desc = "[G]it [B]lame",
				silent = true,
				noremap = true,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "[G]it [P]review" })
		end,
	},
}
