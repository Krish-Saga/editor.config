return {
	{
		"nvim-telescope/telescope.nvim",

		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
			{
				"<leader>fp",
				function()
					require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
				end,
				desc = "Find Plugin File",
			},
			{ "<leader>cs", "<cmd> Telescope colorscheme <cr>", desc = "Installed Colorschemes" },
			{ "<leader>t", "<cmd>Telescope <cr>", desc = "Telescope" },
		},
	},
}
