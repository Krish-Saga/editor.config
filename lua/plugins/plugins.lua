return { 
    {
         "karb94/neoscroll.nvim",
          opts = {},
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {require('plugins.colorthemes')},
    { 'wakatime/vim-wakatime', lazy = false },
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      build = ':TSUpdate'
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
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
}
