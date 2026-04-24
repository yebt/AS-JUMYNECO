-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
      float = {
        source = true
      }
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
        [".*%.component%.html"] = "htmlangular",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        spelllang = "en,es",
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap

        --
        showtabline = 0,
        clipboard = "unnamed",
        exrc=true,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        ["loaded_perl_provider"] = 0,
        ["python3_host_prog"] = 0,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },

    autocmds = {
      _call_spells = {
        {
          event = "FileType",
          pattern = { "text" , "markdown" },
          callback = function()
            vim.opt_local.spell = true
            --
          end,
        },
      },

      --   changecolorsinautocomplete = {
      --     {
      --       event = "InsertEnter",
      --       group = "internalwalo",
      --       callback = function()
      --         --
      --         local colors = {
      --           PmenuSel = { bg = "#282C34", fg = "NONE" },
      --           Pmenu = { fg = "#C5CDD9", bg = "#22252A" },
      --
      --           CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true },
      --           CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold = true },
      --           CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
      --           CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic = true },
      --
      --           CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
      --           CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
      --           CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },
      --
      --           CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
      --           CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
      --           CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },
      --
      --           CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
      --           CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
      --           CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },
      --
      --           CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
      --           CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
      --           CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
      --           CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
      --           CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },
      --
      --           CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
      --           CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },
      --
      --           CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
      --           CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
      --           CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },
      --
      --           CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
      --           CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
      --           CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },
      --
      --           CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
      --           CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
      --           CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
      --         }
      --
      --         for color_name, color_settings in pairs(colors) do
      --           vim.api.nvim_set_hl(0, color_name, color_settings)
      --         end
      --       end,
      --     },
      --   },
      --   -- autocommands are organized into augroups for easy management
      --   autohidetabline = {
      --     -- each augroup contains a list of auto commands
      --     {
      --       -- create a new autocmd on the "User" event
      --       event = "User",
      --       -- the pattern is the name of our User autocommand events
      --       pattern = "AstroBufsUpdated", -- triggered when vim.t.bufs is updated
      --       -- nice description
      --       desc = "Hide tabline when only one buffer and one tab",
      --       -- add the autocmd to the newly created augroup
      --       group = "autohidetabline",
      --       callback = function()
      --         -- if there is more than one buffer in the tab, show the tabline
      --         -- if there are 0 or 1 buffers in the tab, only show the tabline if there is more than one vim tab
      --         local new_showtabline = #vim.t.bufs > 1 and 2 or 1
      --         -- check if the new value is the same as the current value
      --         if new_showtabline ~= vim.opt.showtabline:get() then
      --           -- if it is different, then set the new `showtabline` value
      --           vim.opt.showtabline = new_showtabline
      --         end
      --       end,
      --     },
      --   },
    },
  },
}
