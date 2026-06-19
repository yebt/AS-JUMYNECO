return {

  ---
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- colorscheme = "astrodark",
      -- colorscheme = "catppuccin-mocha",
      -- colorscheme = "catppuccin",
      colorscheme = "catppuccin-nvim",
      -- colorscheme = "koda",
      -- colorscheme = "thorn",
      -- colorscheme = "gruvbox",
      -- colorscheme = "tokyonight",
      -- colorscheme = "oxocarbon",
      -- colorscheme = "oasis",
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
    },
  },
}
