---@type LazySpec
return {
  {
    "github/copilot.vim",
    event = "VeryLazy",
    cmd = "Copilot",
    keys = {
      {
        "<M-l>",
        'copilot#Accept("\\<CR>")',
        mode = "i",
        silent = true,
        replace_keycodes = false,
        expr = true,
        desc = "Accept Copilot suggestion",
      },
    },
  },

  -- {
  --   "yetone/avante.nvim",
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   -- ⚠️ must add this setting! ! !
  --   build = "make",
  --   -- event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   ---@module 'avante'
  --   -- ---@type avante.Config
  --   opts = {
  --     -- provider = "kimi-cli",
  --     provider = "moonshot",
  --     providers = {
  --       moonshot = {
  --         endpoint = "https://api.kimi.com/coding/v1",
  --         model = "kimi-k2.7-code",
  --         timeout = 30000, -- Timeout in milliseconds
  --         extra_request_body = {
  --           temperature = 1,
  --           -- max_tokens = 32768,
  --         },
  --         -- api_key = vim.env.
  --       },
  --     },
  --     selector = {
  --       provider = "snacks",
  --     },
  --     input = {
  --       provider = "snacks",
  --       provider_opts = {
  --         -- Additional snacks.input options
  --         title = "Avante Input",
  --         icon = " ",
  --       },
  --     },
  --     -- acp_providers = {
  --     --
  --     -- },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     -- "nvim-mini/mini.pick", -- for file_selector provider mini.pick
  --     -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     -- "stevearc/dressing.nvim", -- for input provider dressing
  --     -- "folke/snacks.nvim", -- for input provider snacks
  --     -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     -- "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },
}
