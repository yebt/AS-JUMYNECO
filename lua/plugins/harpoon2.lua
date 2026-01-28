return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"
    local extensions = require "harpoon.extensions"
    harpoon:extend(extensions.builtins.navigate_with_number())
    harpoon:extend(extensions.builtins.highlight_current_file())

    -- REQUIRED
    harpoon:setup {}
    -- REQUIRED

    harpoon:extend {
      ADD = function(ctx)
        local file_name = ctx.item.value
        vim.notify("Add: " .. file_name, vim.log.levels.INFO, { title = "Harpoon" })
      end,

      REMOVE = function(ctx)
        local file_name = ctx.item.value
        vim.notify("Del: " .. file_name, vim.log.levels.WARN, { title = "Harpoon" })
      end,
    }

    vim.keymap.set("n", "<leader>A", function() harpoon:list():add() end, { desc = "Harpoon add current buffer" })
    vim.keymap.set("n", "<leader>R", function() harpoon:list():remove() end, { desc = "Harpoon remove current buffer" })
    vim.keymap.set(
      "n",
      "<M-h>",
      function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon toggle quick menu" }
    )

    for i = 1, 9, 1 do
      vim.keymap.set("n", "<M-" .. i .. ">", function() harpoon:list():select(i) end, {
        desc = "Harpoon go to buffer " .. i,
      })
    end
  end,
  keys = {
    { "<M-h>", desc = "Harpoon toggle ui" },
    { "<leader>A", desc = "Harpoon add buff" },
    { "<leader>R", desc = "Harpoon remove buff" },
    { "<M-1>", desc = "Harpoon g->1" },
    { "<M-2>", desc = "Harpoon g->2" },
    { "<M-3>", desc = "Harpoon g->3" },
    { "<M-4>", desc = "Harpoon g->4" },
    { "<M-5>", desc = "Harpoon g->5" },
    { "<M-6>", desc = "Harpoon g->6" },
    { "<M-7>", desc = "Harpoon g->7" },
    { "<M-8>", desc = "Harpoon g->8" },
    { "<M-9>", desc = "Harpoon g->9" },
  },
}
