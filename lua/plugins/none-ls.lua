if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"
    local helpers = require "null-ls.helpers"
    local methods = require "null-ls.methods"

    local oxfmt = helpers.make_builtin {
      name = "oxfmt",
      meta = {
        url = "https://github.com/oxc-project/oxc",
        description = "The Oxidation Compiler is a collection of high-performance tools for JavaScript and TypeScript written in Rust.",
      },
      method = { methods.internal.FORMATTING },
      filetypes = {
        "vue",
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "vuejs",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "markdown.mdx",
        "graphql",
        "handlebars",
        "svelte",
        "astro",
        "htmlangular",
      },
      generator_opts = {
        command = "bunx oxfmt",
        -- arg = helpers.range_formatting_args_factory({
        --   "--stdin",
        -- })
        args = { "--stdin-file-path", "$FILENAME" },
        to_stdin = true,
      },
      factory = helpers.formatter_factory,
    }

    null_ls.register(oxfmt)
    --
    --

    -- opts variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- oxfmt,
      -- null_ls.get_source "oxfmt",
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
    })

    --
    -- local oxfmt = helpers.make_builtin {
    --   name = "oxfmt",
    --   method = methods.internal.FORMATTING,
    --   filetypes = { "ocaml", "reason", "vue" }, -- ajusta según corresponda
    --   generator_opts = {
    --     command = "oxfmt",
    --     args = { "--stdin" },
    --     to_stdin = true,
    --   },
    --   factory = helpers.formatter_factory,
    -- }
    --
    -- opts.sources = opts.sources or {}
    -- table.insert(opts.sources, oxfmt)
  end,
}
