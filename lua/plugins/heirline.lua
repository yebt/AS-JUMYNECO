return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    -- local status = require "astroui.status"
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
            [[%#Constant#%t%#ModeMsg#%{%(bufname() !=# '' ? ' %y' : '')%}]],
            "%H%W%M%R%#Normal#",
            -- [[%#Normal#%{%get(b:,'stl_filetype_icon','··')%}]],
          }
          return table.concat(winbar_components, "%#Statusline#")
        end,
      },
    }
    -- opts.statusline = {}
  end,
}
