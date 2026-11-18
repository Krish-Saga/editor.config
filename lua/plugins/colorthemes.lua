local bg_transparent = false

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = function()
			return {
				style = "night",
				transparent = bg_transparent,
			}
		end,
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight-night")
		end,
		keys = {
			{
				"<leader>bg",
				function()
					bg_transparent = not bg_transparent

					require("tokyonight").setup({
						style = "night",
						transparent = bg_transparent,
					})

					vim.cmd.colorscheme("tokyonight-night")
				end,
				desc = "Toggle Transparent Background",
			},
		},
	},
}
