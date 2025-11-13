return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>a"] = { "ggVG", desc = "Select All" },
          ["<M-c>"] = {
            function()
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if not bufs[2] then require("snacks").dashboard() end
            end,
            desc = "Close buffer",
          },
          -- ["<M-c>"] = { "<Leader>c", desc = "Delete buffer" },
          -- ["<M-d>"] = { "]b", desc = "Delete buffer" },
          -- ["<M-s>"] = { "<cmd>b#<cr>", desc = "Delete buffer" },
          ["¥"] = {
            function()
              if not require("mini.files").close() then require("mini.files").open() end
            end,
            desc = "Explorer",
          },
          ["×"] = {
            function()
              if not require("mini.files").close() then
                require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
              end
            end,
            desc = "Explorer",
          },
          ["<C-p>"] = {
            function()
              require("snacks").picker.files {
                prompt = " ",
                show_delay = 10,
                layout = {
                  cycle = true,
                  -- preview = nil,
                  hidden = { "preview" },
                  layout = {
                    box = "horizontal",
                    backdrop = 80,
                    -- width = 0.8,
                    width = function() return vim.o.columns >= 120 and 0.6 or 0.9 end,
                    height = 0.4,
                    border = "none",
                    {
                      box = "vertical",
                      {
                        win = "input",
                        title = "{title} {live} {flags}",
                        title_pos = "center",
                        border = "rounded",
                        height = 1,
                      },
                      { win = "list", title = " Results ", title_pos = "center", border = "none" },
                    },
                    {
                      win = "preview",
                      title = "{preview:Preview}",
                      width = 0.45,
                      -- border = "rounded",
                      border = "none",
                      title_pos = "center",
                    },
                  },
                },

                formatters = {
                  file = {
                    filename_first = true,
                    truncate = "center",
                    git_status_hl = false,
                  },
                },
              }
            end,
          },
        },
      },
    },
  },

  -- lsp
  -- {
  --   "AstroNvim/astrolsp",
  --   ---@type AstroLSPOpts
  --   opts = {
  --     mappings = {
  --       n = {
  --         -- this mapping will only be set in buffers with an LSP attached
  --         K = {
  --           function()
  --             vim.lsp.buf.hover()
  --           end,
  --           desc = "Hover symbol details",
  --         },
  --         -- condition for only server with declaration capabilities
  --         gD = {
  --           function()
  --             vim.lsp.buf.declaration()
  --           end,
  --           desc = "Declaration of current symbol",
  --           cond = "textDocument/declaration",
  --         },
  --       },
  --     },
  --   },
  -- },
}
