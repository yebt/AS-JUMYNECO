return { -- override blink.cmp plugin
  "Saghen/blink.cmp",
  dependencies = {
    {
      "mikavilpas/blink-ripgrep.nvim",
      version = "*", -- use the latest stable version
    },
  },
  opts = {
    keymap = {
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<M-k>"] = { "show_signature", "fallback" },
      ["<C-L>"] = { function(cmp) cmp.show { providers = { "snippets" } } end },
    },
    -- completion = {
    --   menu = {
    --     border = "",
    --     scrollbar = false,
    --     draw = {
    --       align_to = "label",
    --       columns = {
    --         { "kind_icon" },
    --         { "label", "label_description", gap = 1 },
    --         { "kind" },
    --         { "source_name" },
    --       },
    --     },
    --   },
    -- },

    completion = {
      menu = {
        border = "none",
        scrollbar = true,
        draw = {
          align_to = "label",
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
            { "source_name_3" },
          },
          components = {
            source_name_3 = {
              width = { max = 30 },
              text = function(ctx) return " #" .. ctx.source_name:sub(1, 3) end,
              highlight = "Comment",
            },
          },
        },
      },
    },

    appearance = {
      nerd_font_variant = "mono",
    },
    cmdline = {
      enabled = false,
    },

    signature = {
      enabled = true,

      trigger = {
        enabled = false,
      },
    },
    sources = {
      default = {
        "ripgrep",
      },
      providers = {
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          -- see the full configuration below for all available options
          ---@module "blink-ripgrep"
          ---@type blink-ripgrep.Options
          opts = {},
        },
      },
    },
  },
}
