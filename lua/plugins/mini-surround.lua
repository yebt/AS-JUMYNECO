---@type LazySpec
return {
  "echasnovski/mini.surround",
  keys = {
    "gz",
    { "", [[:<C-u>lua MiniSurround.add('visual')<CR>]], mode = { "x" }, desc = "Add surround" },
  },
}
