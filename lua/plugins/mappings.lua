return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>o"] = { "o<esc>O<cr>", desc = "Add line beetween below" },
          ["<Leader>O"] = { "O<esc>O<cr>", desc = "Add line beetween abobe" },
          --
          ["<Leader>a"] = { "ggVG", desc = "Select All" },
          ["<Leader>y"] = { '"+y', desc = "Copy to clipboard" },
          ["<Leader>Y"] = { '"+y$', desc = "Copy to clipboard" },
          --
          ["<C-k><C-w>"] = {
            function()
              require("astrocore.buffer").close_all()
              local bufs = vim.fn.getbufinfo { buflisted = 1 }
              if not bufs[2] then require("snacks").dashboard() end
            end,
            desc = "Close all buffers",
          },
          --
          ["<M-b>"] = {
            function() require("snacks").explorer() end,
            desc = "Open files with snack",
          },
          ["<M-r>"] = {
            function() require("snacks").explorer.reveal() end,
            desc = "Open files with snack",
          },
          ["<Tab><Tab>"] = {
            function()
              require("snacks").picker.buffers {
                -- layout = { preset = "sidebar", layout = { position = "right" } },
                layout = {
                  preset = "vscode",
                },
              }
            end,
            desc = "Find buffers",
          },
          --
          ["<Leader>rw"] = {
            ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
            desc = "Replace cursor word in the document",
          },
          --
          ["<M-a>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Next buffer" },
          ["<M-d>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<M-s>"] = { function() require("astrocore.buffer").prev() end, desc = "Go to previous buffer" },
          ["<M-c>"] = {
            function()
              local bufs = vim.fn.getbufinfo { buflisted = 1 }
              require("astrocore.buffer").close(0)
              if not bufs[2] then require("snacks").dashboard() end
            end,
            desc = "Close buffer",
          },
          ---
          -- ["<M-c>"] = { "<Leader>c", desc = "Delete buffer" },
          -- ["<M-d>"] = { "]b", desc = "Delete buffer" },
          -- ["<M-s>"] = { "<cmd>b#<cr>", desc = "Delete buffer" },
          ["¥"] = {
            function()
              if not require("mini.files").close() then require("mini.files").open() end
            end,
            desc = "Explorer",
          },
          ["¿"] = {

            function()
              if not require("mini.files").close() then
                require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
              end
            end,
            desc = "Explorer in filepath",
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
                    backdrop = 30,
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
          ["<M-o>"] = {
            function()
              require("snacks").picker.lsp_symbols {
                prompt = " ",
                show_delay = 10,
                layout = {
                  cycle = true,
                  -- preview = nil,
                  hidden = { "preview" },
                  layout = {
                    box = "horizontal",
                    backdrop = 30,
                    -- width = 0.8,
                    width = function() return vim.o.columns >= 120 and 0.6 or 0.9 end,
                    height = 0.8,
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
          ["<Leader>R"] = {
            function() require("snacks").picker.recent {} end,
          },
          -- ["<M-z><M-z>"] = {
          --   function() vim.opt.wrap = not vim.opt.wrap._value end,
          --   desc = "Toggle wrap text",
          -- },
        },
        x = {
          ["<Leader>y"] = { '"+y', desc = "Copy to clipboard" },
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
