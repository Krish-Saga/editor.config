-- vim.keymap.set('n' , '<leader>bg' , function() bg_transparent = not bg_transparent krish() end, {noremap = true , silent = true });
return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "moon" },
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
