return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"
    --
    --- deactive breadcrumbs
    opts.tabline = false
    opts.winbar = {
      {
        provider = function()
          local winbar_components = {
            "%=",
            " >> ",
            [[%#Comment#%<%{expand("%:~:.:h")}%{%(bufname() !=# '' ? '/' : '')%}]],
            -- [[%#Constant#%t%#ModeMsg#%{%(bufname() !=# '' ? ' %y' : '')%}]],
            [[%#Constant#%t%#ModeMsg# ]],
            "%H%W%M%R%#Normal#",
            -- [[%#Normal#%{%get(b:,'stl_filetype_icon','··')%}]],
          }
          return table.concat(winbar_components, "%#Statusline#")
        end,
      },

      status.component.file_info(),
    }
    -- opts.statusline = {}
    opts.statuscolumn = { -- statuscolumn
      -- init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
      status.component.foldcolumn(),
      status.component.numbercolumn(),
      status.component.signcolumn(),
    }
  end,
}
