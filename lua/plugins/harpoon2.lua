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

    vim.keymap.set("n", "<leader>A", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>R", function() harpoon:list():remove() end)
    vim.keymap.set("n", "<M-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    for i = 1, 9, 1 do
      vim.keymap.set("n", "<M-" .. i .. ">", function() harpoon:list():select(i) end)
    end
    --
    -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set("n", "<M-p>", function() harpoon:list():prev() end)
    -- vim.keymap.set("n", "<M-n>", function() harpoon:list():next() end)
  end,
  keys = {
    { "<M-E>" },
    { "<M-A>" },
    { "<M-1>" },
    { "<M-2>" },
    { "<M-3>" },
    { "<M-4>" },
    { "<M-5>" },
    { "<M-6>" },
    { "<M-7>" },
    { "<M-8>" },
    { "<M-9>" },
  },
}
