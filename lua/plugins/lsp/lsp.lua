return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"rust_analyzer",
				"lua_ls",
				"emmet_language_server",
				"cssls",
				"superhtml",
			},
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstall = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
}
