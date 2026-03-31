return { -- override blink.cmp plugin
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = { "snippet_forward", "fallback" },
      -- [""] = { function(cmp) cmp.show { providers = { "ripgrep" } } end },
      ["<M-k>"] = { "show_signature", "fallback" },
      ["<C-L>"] = {
        function(cmp)
          cmp.show {
            providers = { "snippets" },
            initial_selected_item_idx = 1,
          }
        end,
      },
    },
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

    cmdline = {
      enabled = false,
    },

    signature = {
      enabled = true,

      trigger = {
        enabled = false,
      },
    },
  },
}
