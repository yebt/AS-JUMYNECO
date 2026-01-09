return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"
    --
    --- deactive breadcrumbs
    opts.winbar = nil

    --   opts.winbar = { -- winbar
    --     init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
    --     fallthrough = false,
    --     { -- inactive winbar
    --       -- condition = function() return not status.condition.is_active() end,
    --       status.component.separated_path(),
    --       status.component.file_info {
    --         file_icon = {
    --           -- hl = status.hl.file_icon "winbar",
    --           -- padding = { left = 0 },
    --         },
    --         filename = {},
    --         filetype = false,
    --         file_read_only = false,
    --         -- hl = status.hl.get_attributes("winbarnc", true),
    --         surround = false,
    --         update = "BufEnter",
    --       },
    --     },
    --     { -- active winbar
    --       -- status.component.breadcrumbs {
    --       --   hl = status.hl.get_attributes("winbar", true),
    --       -- },
    --     },
    --   }
  end,
}
