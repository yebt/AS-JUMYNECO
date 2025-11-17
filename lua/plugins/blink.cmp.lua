return { -- override blink.cmp plugin
  "Saghen/blink.cmp",
  opts = {
    -- keymap = {
    --   -- ["<Tab>"] = { "snippet_forward", "fallback" },
    --   ["<M-k>"] = { "show_signature", "fallback" },
    -- },
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
      }
    },
  },
}
