return {

  ---
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- colorscheme = "astrodark",
      -- colorscheme = "catppuccin-mocha",
      -- colorscheme = "koda",
      -- colorscheme = "token",
      -- colorscheme = "thorn",
      -- colorscheme = "gruvbox",
      colorscheme = "neodarcula",
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
    "ThorstenRhau/token",
    lazy = true,
  },

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
    "pmouraguedes/neodarcula.nvim",
    lazy = true,
  },
}
