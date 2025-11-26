return {

  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- colorscheme = "kanagawa",
      -- colorscheme = "citruszest",
      colorscheme = "cyberdream",
      -- colorscheme = "kanagawa",
      -- colorscheme = "everblush",
      -- colorscheme = "monokai-pro",
    },
  },

  -- {
  --   "zootedb0t/citruszest.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     option = {
  --       transparent = false, -- Enable/Disable transparency
  --       bold = true,
  --       italic = true,
  --     },
  --     -- Override default highlight style in this table
  --     -- E.g If you want to override `Constant` highlight style
  --     style = {
  --       -- This will change Constant foreground color and make it bold.
  --       -- Constant = { fg = "#FFFFFF", bold = true },
  --     },
  --   },
  -- },

  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors)
        local theme = colors.theme
        local makeDiagnosticColor = function(color)
          local c = require "kanagawa.lib.color"
          return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
        end
        return {

          -- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          -- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          -- PmenuSbar = { bg = theme.ui.bg_m1 },
          -- PmenuThumb = { bg = theme.ui.bg_p2 },
          DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
          DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
          DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
          DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
        }
      end,
      theme = "wave", -- Load "wave" theme
      background = { -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
      },
    },
  },

  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },

  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent_background = false,
  --     terminal_colors = true,
  --     devicons = true, -- highlight the icons of `nvim-web-devicons`
  --     styles = {
  --       comment = { italic = true },
  --       keyword = { italic = true }, -- any other keyword
  --       type = { italic = true }, -- (preferred) int, long, char, etc
  --       storageclass = { italic = true }, -- static, register, volatile, etc
  --       structure = { italic = true }, -- struct, union, enum, etc
  --       parameter = { italic = true }, -- parameter pass in function
  --       annotation = { italic = true },
  --       tag_attribute = { italic = true }, -- attribute of tag in reactjs
  --     },
  --     filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  --     -- Enable this will disable filter option
  --     day_night = {
  --       enable = false, -- turn off by default
  --       day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  --       night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  --     },
  --     inc_search = "background", -- underline | background
  --     background_clear = {
  --       -- "float_win",
  --       "toggleterm",
  --       "telescope",
  --       -- "which-key",
  --       "renamer",
  --       "notify",
  --       -- "nvim-tree",
  --       -- "neo-tree",
  --       -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
  --     }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
  --     plugins = {
  --       bufferline = {
  --         underline_selected = false,
  --         underline_visible = false,
  --       },
  --       indent_blankline = {
  --         context_highlight = "default", -- default | pro
  --         context_start_underline = false,
  --       },
  --     },
  --     ---@param c Colorscheme
  --     override = function(c) end,
  --     ---@param cs Colorscheme
  --     ---@param p ColorschemeOptions
  --     ---@param Config MonokaiProOptions
  --     ---@param hp Helper
  --     -- override = function(cs: Colorscheme, p: ColorschemeOptions, Config: MonokaiProOptions, hp: Helper) end,
  --   },
  -- },
}
