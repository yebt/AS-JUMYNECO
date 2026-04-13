return {

  ---
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- colorscheme = "astrodark",
      -- colorscheme = "catppuccin-mocha",
      -- colorscheme = "koda",
      -- colorscheme = "thorn",
      -- colorscheme = "gruvbox",
      -- colorscheme = "tokyonight",
      -- colorscheme = "oxocarbon",
      colorscheme = "oasis",
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
}
