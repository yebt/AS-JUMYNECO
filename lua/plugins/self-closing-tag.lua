return {
  "AstroNvim/astrocore",
  opts = {
    autocmds = {
      self_closing_tag = {
        {
          event = "FileType",
          pattern = { "html", "vue", "javascriptreact", "typescriptreact", "svelte", "xml" },
          callback = function(args)
            vim.keymap.set("i", "/", function()
              local line = vim.api.nvim_get_current_line()
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local before_cursor = line:sub(1, col)

              -- Detecta si estamos dentro de una etiqueta abierta: <Algo o <algo-cosa
              if before_cursor:match("<%/?[%w%-%.]+%s*[^>]*$") and not before_cursor:match("/$") then
                return " />"
              end

              return "/"
            end, { buffer = args.buf, expr = true })
          end,
        },
      },
    },
  },
}
