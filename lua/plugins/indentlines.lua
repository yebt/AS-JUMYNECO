return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      indent = {
        -- char = "│",
        -- ╎ │ ▏
        char = "▏",
      },
      animate = {
        enabled = false,
      },
      scope = {
        enabled = false,
        underline = true,
        only_current = true,
        char = "▏",
        -- char = "╎",
      },
      chunk = {
        enabled = true,
        only_current = true,
        char = {
          corner_top = "┌",
          corner_bottom = "└",
          -- corner_top = "╭",
          -- corner_bottom = "╰",
          horizontal = "─",
          vertical = "│",
          -- arrow = '>',
          -- arrow = '󰅂',
          -- arrow = '󰧚',
          arrow = "",
        },
      },
    },
  },
}
