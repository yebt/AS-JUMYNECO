vim.filetype.add({
  filename = { ['todo.txt'] = 'todotxt', ['done.txt'] = 'todotxt' },
  pattern  = { ['.*%.todo%.txt'] = 'todotxt' },
})

vim.lsp.config('todotxt', {
  cmd = {
    'node',
    vim.fn.expand(
      '~/Development/Repos/EXPERIMENTAL/servers/server.js'
    ),
  },
  -- /home/webcloster-dev/

  filetypes = { 'todotxt' },
  root_markers = { 'todo.txt' },
})
vim.lsp.enable('todotxt')

-- Autocompletado nativo (si no usas nvim-cmp / blink.cmp)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.name == 'todotxt' then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

return {
  -- TODO.txt
  {
    "phrmendes/todotxt.nvim",
    opts = {
      todotxt = vim.env.HOME .. "/Documents/TODOS/todo.txt",
      donetxt = vim.env.HOME .. "/Documents/TODOS/done.txt",
      max_priority = "C",
      metadata = {
        -- asc/desc strings
        tag = { sort = "asc" },
        due = { sort = "desc" },
        -- custom comparator: a comes before b if tonumber(a) < tonumber(b)
        effort = { sort = function(a, b) return tonumber(a) < tonumber(b) end },
      },
      ghost_text = {
        enable = true,
        mappings = {
          ["(A)"] = "today",
          ["(B)"] = "tomorrow",
          ["(C)"] = "this week",
        },
      },
      lsp = true,
    },
    keys = {
      { "<leader>zn", "<cmd>TodoTxt new<cr>", desc = "New TODO entity" },
      { "<leader>zt", "<cmd>TodoTxt<cr>", desc = "Toggle todo.txt" },
      { "<leader>zd", "<cmd>DoneTxt<cr>", desc = "Toggle done.txt" },
      { "<leader>zg", "<cmd>TodoTxt ghost<cr>", desc = "Toggle ghost text" },
    },
  },
}
