return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"

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
  end
}
