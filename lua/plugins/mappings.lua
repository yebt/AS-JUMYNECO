return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<Leader>a"] = { "ggVG", desc = "Select All" },
          ["<Leader>y"] = { '"+y', desc = "Copy to clipboard" },
          ["<Leader>Y"] = { '"+y$', desc = "Copy to clipboard" },

          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },

          ["<C-p>"] = {
            function()
              require("snacks").picker.files {
                layout = {
                  preset = "vscode",
                  layout = {
                    backdrop = 30,
                    width = function() return vim.o.co >= 120 and 0.6 or 0.9 end,
                    height = 0.5,
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
            desc = "Pick file",
          },
          ["<M-p>"] = {
            function()
              require("snacks").picker.smart {
                layout = {
                  preset = "ivy",
                },
              }
            end,
          },

          ["<C-o>"] = {
            function() require("snacks").picker.lsp_symbols() end,
            desc = "Pick lsp symbol",
          },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
