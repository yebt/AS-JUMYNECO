return {
  -- Snipper
  {
    "leath-dub/snipe.nvim",
    keys = {
      { "<M-m>", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" },
    },
    opts = {},
  },
}
