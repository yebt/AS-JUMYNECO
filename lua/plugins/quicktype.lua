local function quickType(lang)
  if not lang then
    vim.notify("Please specify a language (e.g., 'typescript')", vim.log.levels.ERROR)
    return
  end

  local buf = vim.fn.getreg "+"
  local tmp = vim.fn.tempname() .. ".json"
  local f = io.open(tmp, "w")
  if not f then
    vim.notify("Failed to create temporary file", vim.log.levels.ERROR)
    return
  end

  f:write(buf)
  f:close()

  local cmd = "quicktype " .. tmp .. " --lang " .. lang .. " --just-types 2>&1"
  local output = vim.fn.systemlist(cmd)

  if vim.v.shell_error ~= 0 then
    vim.notify(table.concat(output, "\n"), vim.log.levels.ERROR)
    return
  end

  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row, row, false, output)
end

return {
  "AstroNvim/astrocore",
  opts = {
    commands = {
      QuickType = {
        function(opts)
          local lang = opts.args ~= "" and opts.args or "typescript"
          quickType(lang)
        end,
        nargs = "?", -- 0 o 1 argumento
        desc = "Generate types from clipboard JSON using quicktype",
      },
    },
  },
}
