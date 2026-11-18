local bg_transparent = false

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        opts = function()
            return {
                transparent_background = bg_transparent,
            }
        end,

        keys = {
            {
                "<leader>bg",
                function()
                    bg_transparent = not bg_transparent

                    require("catppuccin").setup({
                        transparent_background = bg_transparent,
                    })

                    vim.cmd.colorscheme("catppuccin")
                end,
                desc = "Toggle Transparent Background",
            },
        },
    },
}
