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
              local row = vim.api.nvim_win_get_cursor(0)[1] - 1 -- 0-indexed
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local before_cursor = line:sub(1, col)
              local after_cursor = line:sub(col + 1)

              -- 1. Detectar si estamos dentro de un string
              local in_double, in_single = false, false
              for ch in before_cursor:gmatch(".") do
                if ch == '"' and not in_single then
                  in_double = not in_double
                elseif ch == "'" and not in_double then
                  in_single = not in_single
                end
              end
              if in_double or in_single then
                return "/"
              end

              -- 2. Verificar etiqueta abierta válida antes del cursor
              if not before_cursor:match("<%/?[%w%-%.]+[^>]*$") then
                return "/"
              end

              -- 3. Ya está autocerrada
              if before_cursor:match("/$") or after_cursor:match("^%s*/>") then
                return "/"
              end

              -- 4. Hay un '>' suelto después → reemplazar con '/>'
              local gt_match = after_cursor:match("^(%s*>)")
              if gt_match then
                local end_col = col + #gt_match
                -- Reemplaza los caracteres después del cursor hasta el '>' con '/>'
                vim.api.nvim_buf_set_text(0, row, col, row, end_col, { "/>" })
                -- Mover cursor al final de '/>'
                vim.api.nvim_win_set_cursor(0, { row + 1, col + 2 })
                return ""
              end

              return " />"
            end, { buffer = args.buf, expr = true })
          end,
        },
      },
    },
  },
}

--- BUG: v1 
--- NO close ok

-- return {
--   "AstroNvim/astrocore",
--   opts = {
--     autocmds = {
--       self_closing_tag = {
--         {
--           event = "FileType",
--           pattern = { "html", "vue", "javascriptreact", "typescriptreact", "svelte", "xml" },
--           callback = function(args)
--             vim.keymap.set("i", "/", function()
--               local line = vim.api.nvim_get_current_line()
--               local col = vim.api.nvim_win_get_cursor(0)[2]
--               local before_cursor = line:sub(1, col)
--
--               -- Detecta si estamos dentro de una etiqueta abierta: <Algo o <algo-cosa
--               if before_cursor:match("<%/?[%w%-%.]+%s*[^>]*$") and not before_cursor:match("/$") then
--                 return " />"
--               end
--
--               return "/"
--             end, { buffer = args.buf, expr = true })
--           end,
--         },
--       },
--     },
--   },
-- }

