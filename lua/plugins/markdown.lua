return {
  {
    "roodolv/markdown-toggle.nvim",
    config = {
      keymaps = {
        toggle = {
          -- ["<C-q>"] = "quote",
          -- ["<C-l>"] = "list",
          -- ["<Leader><C-l>"] = "list_cycle",
          -- ["<C-n>"] = "olist",
          ["<M-x>"] = "checkbox",
          ["<Leader><M-x>"] = "checkbox_cycle",
          -- ["<C-h>"] = "heading",
          -- ["<Leader><C-h>"] = "heading_toggle",
        },
      },

      cycle_box_table = false,
      box_table = { "x", "~", ">" },
    },
    -- config = function()
    --
    --   require("markdown-toggle").setup {
    --     toggle = {
    --       -- ["<C-q>"] = "quote",
    --       ["<C-l>"] = "list",
    --       ["<Leader><C-l>"] = "list_cycle",
    --       -- ["<C-n>"] = "olist",
    --       ["<M-x>"] = "checkbox",
    --       ["<Leader><M-x>"] = "checkbox_cycle",
    --       -- ["<C-h>"] = "heading",
    --       -- ["<Leader><C-h>"] = "heading_toggle",
    --     },
    --
    --     autolist = {
    --       ["O"] = "autolist_up", -- Obsidian does not have `autolist_up`
    --       ["o"] = "autolist_down", -- Obsidian does not have `autolist_down`
    --       ["<CR>"] = "autolist_cr",
    --     },
    --   }
    -- end,
  },
  --   {
  --     "roodolv/markdown-toggle.nvim",
  --     ft = "markdown", -- Load only for markdown files
  --     config = function()
  -- require("markdown-toggle").setup()
  --       -- Set a keymap in normal mode to toggle the checkbox under the cursor
  --       vim.keymap.set(
  --         "n",
  --         "<leader>x",
  --         require("markdown-toggle").toggle_checkbox,
  --         { desc = "Toggle Markdown Checkbox" }
  --       )
  --     end,
  --   },
}
