math.randomseed(os.time())
require("core.keymaps")
require("core.options")
require("lazyvim")
vim.cmd.colorscheme("tokyonight")

if vim.g.neovide then
	vim.opt.winblend = 100
	vim.opt.pumblend = 100
	vim.g.neovide_floating_blur_amount_x = 30
	vim.g.neovide_floating_blur_amount_y = 30
end
