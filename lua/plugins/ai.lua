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
}
