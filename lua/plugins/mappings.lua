return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>a"] = { "ggVG", desc = "Select All" },
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
