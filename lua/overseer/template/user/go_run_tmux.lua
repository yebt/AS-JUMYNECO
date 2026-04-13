return {
  name = "Run Go file in tmux",
  builder = function()
    local file = vim.fn.expand("%:p")
    local pane = "go_runner"

    return {
      cmd = "bash",
      args = {
        "-c",
        string.format([[
          tmux send-keys -t 2 "clear" C-m "go run %s" C-m
        ]], file)
      },
      components = { "default" },
    }
  end,
  condition = {
    filetype = { "go" },
  },
}
