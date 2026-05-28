return{
{
  "folke/snacks.nvim",

  opts = function()
    math.randomseed(os.time())

    local function get_random_ascii()
      local path = vim.fn.stdpath("config") .. "/ascii"
      local files = vim.fn.glob(path .. "/*.txt", false, true)

      if #files == 0 then
        return { "No ASCII found" }
      end

      local file = files[math.random(#files)]

      return vim.fn.readfile(file)
    end

    local ascii = get_random_ascii()

    local term_height = vim.o.lines
    local term_width = vim.o.columns

    local ascii_height = #ascii

    local max_width = 0

    for _, line in ipairs(ascii) do
      max_width = math.max(max_width, vim.fn.strdisplaywidth(line))
    end

    local align = "center"

    -- if too tall OR too wide -> move left
    if ascii_height > math.floor(term_height * 0.30)
      or max_width > math.floor(term_width * 0.75)
    then
      align = "left"
    end

    local function refresh_dashboard()
      vim.cmd("close")
      Snacks.dashboard()
    end

    return {
      dashboard = {
        preset = {
          header = table.concat(ascii, "\n"),

          keys = {
            {
              icon = " ",
              key = "f",
              desc = "Find File",
              action = ":lua Snacks.dashboard.pick('files')",
            },

            {
              icon = " ",
              key = "n",
              desc = "New File",
              action = ":ene | startinsert",
            },

            {
              icon = " ",
              key = "g",
              desc = "Find Text",
              action = ":lua Snacks.dashboard.pick('live_grep')",
            },

            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },

            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },

            {
              icon = "󰒲 ",
              key = "l",
              desc = "Lazy",
              action = ":Lazy",
            },

            {
              icon = "󰑐 ",
              key = "R",
              desc = "Refresh Dashboard",
              action = refresh_dashboard,
            },

            {
              icon = " ",
              key = "q",
              desc = "Quit",
              action = ":qa",
            },
          },
        },

        formats = {
          header = {
            "%s",
            align = align,
          },
        },
      },
    }
  end,
},
}
