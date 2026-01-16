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
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
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
    { "<M-e>" },
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
