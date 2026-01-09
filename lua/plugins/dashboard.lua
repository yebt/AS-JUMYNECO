return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = "<< NVIM >>",
        -- header = "#<complex>#",
        -- header = table.concat({
        --   ">o)",
        --   "(_>",
        -- }, "\n"),
        -- header = table.concat({
        --   "░█░█░█▄█░█░█░",
        --   "░▀▀▀░▀░▀░▀▀▀░",
        -- }, "\n"),
        -- header = table.concat({
        -- "░▄█▄█▄",
        -- "░░▀░▀░",
        -- "░█▀█░█░█░▀█▀░█▄█",
        -- "░█░█░▀▄▀░░█░░█░█",
        -- "░▀░▀░░▀░░▀▀▀░▀░▀",
        -- }, "\n"),

        keys = {
          -- { icon = " ", key = "n", desc = "New", action = ":ene | startinsert" },
          -- { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          -- { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          -- { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "s", desc = "Restore Session", action = "<Leader>Sl" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },

      formats = {
        key = function(item) return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } } end,
      },

      sections = {
        { section = "header", padding = 1 },
        -- { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
        { title = " MRU ", padding = 1 },
        { section = "recent_files", limit = 5, padding = 1 },
        -- { title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
        { title = " MRU CWD ", padding = 1 },
        { section = "recent_files", cwd = true, limit = 5, padding = 1 },
        -- -- { title = " KEYS ", padding = 1 },
        -- -- { title = "Sessions", padding = 1 },
        -- -- { section = "projects", padding = 1 },
        -- { title = " Bookmarks", padding = 1 },
        { section = "keys", padding = 1 },
        { section = "startup" },
      },
    },
  },
}
