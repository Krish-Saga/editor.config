require('lazy').setup({
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
     "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
},
{
     "karb94/neoscroll.nvim",
      opts = {},
},
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},
{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }
},
{require('plugins.colorthemes')},
{ 'wakatime/vim-wakatime', lazy = false },
{
    "mason-org/mason.nvim",
    opts = {},
    config = function()

        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
    end,
},
{
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate'
},
{
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {
              "rust_analyzer",
              "lua_ls",
              "taplo",
            },
                automatic_enable = {
                "lua_ls",
                "vimls",
                "rust_analyzer",
            },
      })
    end,
},
{
    "nvim-mini/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "string" },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    },
},
{
    "neovim/nvim-lspconfig",

    config = function()
      vim.lsp.enable("rust_analyzer")
    end,
},
{
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
},
{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
require('plugins.dashboard'),
require('plugins.ui'),
})
