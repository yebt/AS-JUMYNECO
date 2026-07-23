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
      -- colorscheme = "thorn",
      -- colorscheme = "gruvbox",
      -- colorscheme = "tokyonight",
      -- colorscheme = "oxocarbon",
      -- colorscheme = "oasis",
      colorscheme = "sora",
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
  -- {
  --   "ThorstenRhau/token",
  --   lazy = true,
  -- },

  ---
  {
    "jpwol/thorn.nvim",
    lazy = true,
    opts = {
      background = "warm",
    },
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

  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
  },

  {
    "uhs-robert/oasis.nvim",
    lazy = true,
    opts = {
      style = "starlight", -- lagoon, starlight
    },
  },

  ---
  {
    "sainnhe/gruvbox-material",
    lazy = true,
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
    "pmouraguedes/neodarcula.nvim",
    lazy = true,
    priority = 1000,
  },

  -- {
  --   "https://gitlab.com/bartekjaszczak/distinct-nvim",
  --   lazy = true,
  -- },

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
}
