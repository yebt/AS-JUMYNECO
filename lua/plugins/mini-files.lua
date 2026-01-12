return {
  "nvim-mini/mini.files",
  -- opts = {
  --   windows = {
  --     preview = true,
  --   },
  -- },
  specs = {
    {
      "AstroNvim/astrolsp",
      optional = true,
      specs = {
        {
          "AstroNvim/astrocore",
          ---@type AstroCoreOpts
          opts = {
            mappings = {
              n = {
                ["<Leader>E"] = {
                  function()
                    if not require("mini.files").close() then
                      require("mini.files").open(vim.api.nvim_buf_get_name(0))
                    end
                  end,
                  desc = "Explorer",
                },
              },
            },
            autocmds = {
              mini_files_mapping_actions = {
                {
                  event = "User",
                  pattern = "MiniFilesBufferCreate",
                  desc = "Create mappings to modify target window via split",
                  callback = function(args)
                    local files = require "mini.files"
                    local buf_id = args.data.buf_id

                    -- Yank in register full path of entry under cursor
                    local yank_path = function()
                      local path = (files.get_fs_entry() or {}).path
                      if path == nil then return vim.notify "Cursor is not on valid entry" end
                      vim.fn.setreg(vim.v.register, path)
                      vim.notify "Path Yandked"
                    end

                    local togglePreview = function() files.config.windows.preview = not files.config.windows.preview end

                    -- Open path with system default handler (useful for non-text files)
                    local ui_open = function() vim.ui.open(files.get_fs_entry().path) end

                    vim.keymap.set("n", "gX", ui_open, { buffer = buf_id, desc = "OS open" })
                    vim.keymap.set("n", "gy", yank_path, { buffer = buf_id, desc = "Yank path" })
                    -- vim.keymap.set("n", "p", togglePreview, { buffer = buf_id, desc = "Toggle preview" })
                  end,
                },
                {
                  event = "User",
                  pattern = "MiniFilesWindowOpen",
                  callback = function(args)
                    local win_id = args.data.win_id
                    -- Customize window-local settings
                    -- vim.wo[win_id].winblend = 50
                    local config = vim.api.nvim_win_get_config(win_id)
                    -- config.border = "double"
                    config.title_pos = "right"
                    vim.api.nvim_win_set_config(win_id, config)
                  end,
                },
                -- {
                --   event = "User",
                --   pattern = "MiniFilesWindowUpdate",
                --   callback = function(args)
                --     local config = vim.api.nvim_win_get_config(args.data.win_id)
                --
                --     -- Ensure fixed height
                --     config.height = 10
                --
                --     -- Ensure no title padding
                --     local n = #config.title
                --     config.title[1][1] = config.title[1][1]:gsub("^ ", "")
                --     config.title[n][1] = config.title[n][1]:gsub(" $", "")
                --
                --     vim.api.nvim_win_set_config(args.data.win_id, config)
                --   end,
                -- },
              },
            },
          },
        },
      },
    },
  },
}
