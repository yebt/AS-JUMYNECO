-- if true then return {} end --- WARNING: remove to activate the rest

return {

  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- colorscheme = "astrodark",
      -- colorscheme = "tokyonight",
      -- colorscheme = "kanagawa",
      -- colorscheme = "citruszest",
      -- colorscheme = "cyberdream",
      -- colorscheme = "onedark",
      -- colorscheme = "kanagawa",
      -- colorscheme = "everblush",
      -- colorscheme = "monokai-pro",
      -- colorscheme = "vitesse",
      colorscheme = "catppuccin",
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
    lazy = true,
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

  -- CD
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    -- lazy = false,
    -- priority = 1000,
  },

  -- OD
  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = {
      toggle_style_key = "<M-t>", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
      style = "warmer",
      code_style = {
        comments = "italic",
        keywords = "bold",
        functions = "none",
        strings = "italic",
        variables = "none",
      },
      cmp_itemkind_reverse = true,
      ending_tildes = true,
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      -- require("onedark").load()
    end,
  },

  -- V
  {
    "https://codeberg.org/pdewey/vitesse-nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
    },
  },

  {
    "zootedb0t/citruszest.nvim",
    lazy = true,
    opts = {
      option = {
        transparent = false, -- Enable/Disable transparency
        bold = false,
        italic = true,
      },
      -- Override default highlight style in this table
      -- E.g If you want to override `Constant` highlight style
      style = {
        -- This will change Constant foreground color and make it bold.
        Constant = { fg = "#FFFFFF", bold = true },
      },
    },
  },

  --
  {
    "catppuccin/nvim",
    name = "catppuccin",

    --prism-scheme: dark;
    --prism-foreground: #d4cfbf;
    --prism-background: #1e1e1e;
    --prism-comment: #758575;
    --prism-string: #d48372;
    --prism-literal: #429988;
    --prism-keyword: #4d9375;
    --prism-function: #a1b567;
    --prism-deleted: #a14f55;
    --prism-class: #54b1bf;
    --prism-builtin: #e0a569;
    --prism-property: #dd8e6e;
    --prism-namespace: #db889a;
    --prism-punctuation: #858585;
    --prism-decorator: #bd8f8f;
    --prism-number: #6394bf;
    --prism-boolean: #1c6b48;
    --prism-variable: #c2b36e;
    --prism-regex: #ab5e3f;
    --prism-json-property: #6b8b9e;
    --prism-line-number: #888888;
    --prism-line-number-gutter: #eeeeee;
    --prism-line-highlight-background: #444444;
    --prism-selection-background: #444444;

    opts = {
      color_overrides = {
        mocha = {
          rosewater = "#bd8f8f",
          flamingo = "#ab5e3f",
          pink = "#d48372",
          mauve = "#a1b567",
          red = "#a14f55",
          maroon = "#db889a",
          peach = "#dd8e6e",
          -- yellow    = "#e0a569",
          yellow = "#FCCA46",
          green = "#4d9375",
          teal = "#429988",
          sky = "#54b1bf",
          sapphire = "#6394bf",
          blue = "#6b8b9e",
          lavender = "#c2b36e",
          text = "#d4cfbf",
          subtext1 = "#889688",
          subtext0 = "#758575",
          overlay2 = "#858585",
          overlay1 = "#756d6d",
          overlay0 = "#63775E",
          surface2 = "#444444",
          surface1 = "#313131",
          surface0 = "#2d2d2d",
          -- base      = "#1e1e1e",
          base = "#111111",
          mantle = "#232323",
          crust = "#111111",
        },
      },
      -- custom_highlights = {},
      -- custom_highlights = function(C)
      --   return {
      --   }
      -- end,

      integrations = {
        blink_cmp = {
          style = "bordered",
        },
      },
    },
  },
}
