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

      -- colorscheme = "tokyonight",

      --- Favorites
      -- colorscheme = "sora",
      -- colorscheme = "sora",
      -- colorscheme = "flume-mira",
      -- colorscheme = "oshen-night"
      colorscheme = "monokai-pro",
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
    lazy = true,
    priority = 1000,
    opts = {
      filter = "ristretto", -- classic | octagon | pro | machine | ristretto | spectrum
      -- override_palette = function(filter)
      override_palette = function()
        return {

          dark2 = "#161413",
          dark1 = "#0B0A09",
          background = "#1c1917",

          -- background = "#1A1B26",
          -- text = "#C0CAF5",
          -- accent1 = "#f7768e",
          -- accent2 = "#7aa2f7",
          -- accent3 = "#e0af68",
          -- accent4 = "#9ece6a",
          -- accent5 = "#0DB9D7",
          -- accent6 = "#9d7cd8",
          -- dimmed1 = "#737aa2",
          -- dimmed2 = "#787c99",
          -- dimmed3 = "#363b54",
          -- dimmed4 = "#363b54",

          dimmed5 = "#171513",
        }
      end,
    },
  },
}
