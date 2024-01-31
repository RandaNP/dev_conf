return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		"s1n7ax/nvim-window-picker",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			default_component_configs = {
				modified = {
					symbol = "●", -- "",
					highlight = "NeoTreeModified",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
			filesystem = {
				window = {
					mappings = {
						["S"] = "none",
						["_"] = "open_split",
						["|"] = "open_vsplit",
						["s"] = "system_open",
					},
				},
				commands = {
					system_open = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						-- macOs: open file in default application in the background.
						vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
						-- Linux: open file in default application
						vim.fn.jobstart({ "xdg-open", path }, { detach = true })
					end,
				},
			},
		})

		vim.keymap.set("n", "<CR>", ":Neotree toggle<CR>", {})
		vim.keymap.set("n", "<leader>gs", ":Neotree float git_status<CR>", { desc = "[G]it [S]tatus" })

		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
	end,
}
