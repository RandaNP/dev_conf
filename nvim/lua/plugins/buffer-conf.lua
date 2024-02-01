return {
	{
		"famiu/bufdelete.nvim",
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					close_command = "Bdelete! %d",
					right_mouse_command = "Bdelete! %d",
					separator_style = "slant",
					numbers = function(opts)
						return string.format("%s", opts.raise(opts.id))
					end,
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							text_align = "left",
							separator = true,
						},
						{
							filetype = "dbui",
							text = "Database connections",
							text_align = "left",
							separator = true,
						},
					},
				},
			})
		end,
	},
}
