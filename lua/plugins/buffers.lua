return {
  -- Snipper
  {
    "leath-dub/snipe.nvim",
    keys = {
      { "<M-m>", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" },
    },
    opts = {

      preselect_current = true,
      preselect = function() return require("snipe").preselect_by_classifier "#" end,

      hints = {
        dictionary = "asdflewcmpghio",
      },
    },
  },
}
