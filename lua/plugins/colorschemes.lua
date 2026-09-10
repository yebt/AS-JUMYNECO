return {

  ---
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- colorscheme = "astrodark",

      -- colorscheme = "catppuccin-mocha",
      -- colorscheme = "catppuccin",
      -- colorscheme = "catppuccin-nvim",
      -- colorscheme = "solarized-osaka",
      -- colorscheme = "koda",
      -- colorscheme = "gruvbox",

      colorscheme = "tokyonight",

      --- Favorites
      -- colorscheme = "sora",
      -- colorscheme = "sora",
      -- colorscheme = "flume-mira",
      -- colorscheme = "oshen-night"
      -- colorscheme = "monokai-pro",
    },
  },

  {
    "AstroNvim/astrotheme",
    opts = {
      palette = "astrodark",
      style = {
        transparent = false, -- Bool value, toggles transparency.
        inactive = true, -- Bool value, toggles inactive window color.
        float = true, -- Bool value, toggles floating windows background colors.
        neotree = true, -- Bool value, toggles neo-trees background color.
        border = true, -- Bool value, toggles borders.
        title_invert = true, -- Bool value, swaps text and background colors.
        italic_comments = true, -- Bool value, toggles italic comments.
        simple_syntax_colors = true, -- Bool value, simplifies the amounts of colors used for syntax highlighting.
      },
      palettes = {
        astrodark = {
          ui = {
            -- background = "#1A1D23"
            base = "#00151B",
          },
        },
      },
    },
  },

  ---
  {
    "oskarnurm/koda.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
  },

  ---
  {
    "https://gitlab.com/motaz-shokry/gruvbox.nvim",
    name = "gruvbox",
    lazy = true,
    opts = {
      variant = "hard",
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      dim_inactive = true,

      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      on_colors = function(colors)
        colors.bg = "#121212"
        colors.bg_dark = "#1e1e1e"
        colors.bg_dark1 = "#222222"
        colors.bg_float = "#181818"
        -- colors.bg_highlight = "#282828"
        -- colors.bg_popup = "#181818"
        -- colors.bg_search = "#323232"
        -- colors.bg_sidebar = "#181818"
        -- colors.bg_statusline = "#181818"
        -- colors.bg_visual = "#332333"
        -- colors.black = "#121212"
        -- colors.blue = "#6394bf"
        -- colors.blue0 = "#4a7091"
        -- colors.blue1 = "#54b1bf"
        -- colors.blue2 = "#429988"
        -- colors.blue5 = "#7cb2d6"
        -- colors.blue6 = "#a0d1e8"
        -- colors.blue7 = "#2d4458"
        -- colors.border = "#2d2d2d"
        -- colors.border_highlight = "#54b1bf"
        -- colors.comment = "#758575"
        -- colors.cyan = "#54b1bf"
        -- colors.dark3 = "#333333"
        -- colors.dark5 = "#2212122"
        -- colors.diff = {
        --   add = "#253b30",
        --   change = "#27384a",
        --   delete = "#3e2427",
        --   text = "#2d4458",
        -- }
        -- colors.error = "#a14f55"
        -- colors.fg = "#d4cfbf"
        -- colors.fg_dark = "#a8a497"
        -- colors.fg_float = "#d4cfbf"
        -- colors.fg_gutter = "#555555"
        -- colors.fg_sidebar = "#a8a497"
        -- colors.git = {
        --   add = "#4d9375",
        --   change = "#6394bf",
        --   delete = "#a14f55",
        --   ignore = "#555555",
        -- }
        -- colors.green = "#a1b567"
        -- colors.green1 = "#4d9375"
        -- colors.green2 = "#429988"
        -- colors.hint = "#429988"
        -- colors.info = "#54b1bf"
        -- colors.magenta = "#bd8f8f"
        -- colors.magenta2 = "#db889a"
        -- colors.none = "NONE"
        -- colors.orange = "#e0a569"
        -- colors.purple = "#bd8f8f"
        -- colors.rainbow = { "#6394bf", "#e0a569", "#a1b567", "#429988", "#bd8f8f", "#c2b36e", "#dd8e6e", "#d48372" }
        -- colors.red = "#d48372"
        -- colors.red1 = "#a14f55"
        -- colors.teal = "#429988"
        -- colors.terminal = {
        --   black = "#1e1e1e",
        --   black_bright = "#333233",
        --   blue = "#6394bf",
        --   blue_bright = "#7cb2d6",
        --   cyan = "#54b1bf",
        --   cyan_bright = "#80ccd8",
        --   green = "#a1b567",
        --   green_bright = "#b8ce79",
        --   magenta = "#bd8f8f",
        --   magenta_bright = "#d4a9a9",
        --   red = "#d48372",
        --   red_bright = "#e69989",
        --   white = "#a8a497",
        --   white_bright = "#d4cfbf",
        --   yellow = "#e0a569",
        --   yellow_bright = "#f2bc85",
        -- }
        -- colors.terminal_black = "#333233"
        -- colors.todo = "#6394bf"
        -- colors.warning = "#e0a569"
        -- colors.yellow = "#c2b36e"
      end,
    },
  },

  ---
  {
    "54L1M/Oshen.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      -- transparent = true, -- set false for opaque background
    },
    -- config = function()
    --   require("oshen").setup {
    --     -- transparent = true, -- set false for opaque background
    --   }
    --   vim.cmd.colorscheme "oshen-night" -- or "oshen-day" for light
    -- end,
  },

  {
    "https://github.com/ThorstenRhau/token",
    lazy = true,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      -- color_overrides = {
      --   mocha = {
      --     rosewater = "#f5e0dc",
      --     flamingo  = "#f2cdcd",
      --     pink      = "#f5c2e7",
      --     mauve     = "#cba6f7",
      --     red       = "#f38ba8",
      --     maroon    = "#eba0ac",
      --     peach     = "#fab387",
      --     yellow    = "#f9e2af",
      --     green     = "#a6e3a1",
      --     teal      = "#94e2d5",
      --     sky       = "#89dceb",
      --     sapphire  = "#74c7ec",
      --     blue      = "#89b4fa",
      --     lavender  = "#b4befe",
      --     text      = "#FEFFFE",
      --     subtext1  = "#FDF6E3",
      --     subtext0  = "#EFE9D5",
      --     overlay2  = "#9399b2",
      --     overlay1  = "#7f849c",
      --     overlay0  = "#6c7086",
      --     surface2  = "#585b70",
      --     surface1  = "#455159",
      --     surface0  = "#324145",
      --     base      = "#00151B",
      --     mantle    = "#012029",
      --     crust     = "#012B36",
      --   },
      -- },
    },
  },

  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    opts = {
      transparent = false,
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
    },
  },

  {
    "Aejkatappaja/sora",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = false,
    },
    -- config = function(_, opts)
    --   require("sora").setup(opts)
    --   vim.cmd("colorscheme sora")
    -- end,
  },

  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup()
      -- vim.cmd.colorscheme "monokai-pro"
    end,
  },
}
