-- ~/.config/nvim/lua/plugins/colors.lua
-- VS-Code-style inline colour swatches + an interactive colour picker.
-- Requires: Neovim >= 0.10, termguicolors on, a true-colour terminal.

---------------------------------------------------------------------------
-- Click-to-pick: click a colour value and the picker opens on it.
-- This block MUST sit ABOVE the `return { ... }` at the bottom: in Lua a
-- `return` has to be the last statement in a block, so no code can follow it.
---------------------------------------------------------------------------
vim.opt.mouse = "a" -- click events must be forwarded to Neovim

-- Lua patterns have no alternation (that's Vim regex), so keep a list.
local patterns = {
    "#%x%x%x%x%x%x%x%x", -- #rrggbbaa
    "#%x%x%x%x%x%x",     -- #rrggbb
    "#%x%x%x%x",         -- #rgba
    "#%x%x%x",           -- #rgb
    "rgba?%(%s*[^)]*%)", -- rgb(...) / rgba(...)
    "hsla?%(%s*[^)]*%)", -- hsl(...) / hsla(...)
    "hwb%(%s*[^)]*%)",
    "oklch%(%s*[^)]*%)",
}

local function on_color(line, col)
    for _, p in ipairs(patterns) do
        local s = 1
        while true do
            local a, b = line:find(p, s)
            if not a then
                break
            end
            if col >= a - 1 and col <= b then -- a-1: tolerate the inline swatch glyph
                return true
            end
            s = b + 1
        end
    end
    return false
end

vim.keymap.set("n", "<LeftMouse>", function()
    local m = vim.fn.getmousepos()
    local line = vim.fn.getline(m.line)
    if m.column >= 1 and line ~= "" and on_color(line, m.column) then
        local win = (m.winid and m.winid > 0) and m.winid or 0
        vim.api.nvim_win_set_cursor(win, { m.line, m.column - 1 })
        vim.cmd("PickColor")
    else
        local key = vim.api.nvim_replace_termcodes("<LeftMouse>", true, false, true)
        vim.api.nvim_feedkeys(key, "n", false) -- "n" = do not remap, so no recursion
    end
end, { desc = "Click a colour to open the picker" })

return {
    ---------------------------------------------------------------------------
    -- 1. The swatch next to every colour literal  (the VS Code square)
    ---------------------------------------------------------------------------
    {
        "brenoprata10/nvim-highlight-colors",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            render = "virtual",
            virtual_symbol = "■",
            virtual_symbol_position = "inline", -- inline / eol / eow

            enable_hex = true,
            enable_short_hex = true,
            enable_rgb = true,
            enable_hsl = true,
            enable_var_usage = true,
            enable_named_colors = true,
            enable_tailwind = false,

            exclude_filetypes = { "lazy", "mason", "help", "TelescopePrompt", "NvimTree" },
            exclude_buftypes = { "nofile", "prompt" },
        },
    },

    ---------------------------------------------------------------------------
    -- 2. The picker itself  (sliders, RGBA, format conversion)
    ---------------------------------------------------------------------------
    {
        "ziontee113/color-picker.nvim",
        cmd = { "PickColor", "PickColorInsert", "ConvertHEXandRGB", "ConvertHEXandHSL" },
        keys = {
            { "<leader>cp", "<cmd>PickColor<cr>",        mode = "n", desc = "Colour picker" },
            { "<C-c>",      "<cmd>PickColorInsert<cr>",  mode = "i", desc = "Colour picker (insert)" },
            { "<leader>ch", "<cmd>ConvertHEXandRGB<cr>", mode = "n", desc = "HEX <-> RGB" },
            { "<leader>cs", "<cmd>ConvertHEXandHSL<cr>", mode = "n", desc = "HEX <-> HSL" },
        },
        opts = {
            border = "rounded",
            icons = { "■", "●" },
            keymap = {
                ["U"] = "<Plug>ColorPickerSlider5Decrease",
                ["O"] = "<Plug>ColorPickerSlider5Increase",
            },
            background_highlight_group = "Normal",
            border_highlight_group = "FloatBorder",
            text_highlight_group = "Normal",
        },
    },
}
