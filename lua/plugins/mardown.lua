return {
  {
    "roodolv/markdown-toggle.nvim",
    event = "VeryLazy",
    opts = {
      keymaps = {
        toggle = {
          ["<M-x>"] = "checkbox",
          ["<leader><M-x>"] = "checkbox_cycle",
        },
      },
      cycle_box_table = false,
      box_table = { "x", "~", ">" },
    },
    -- config = function()
    --   require("markdown-toggle").setup()
    -- end,
  },
}
