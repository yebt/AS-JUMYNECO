return {
  "wintermute-cell/gitignore.nvim",
  lazy = true,
  cmd = {
    "Gitignore",
    "GITI",
  },
  config = function()
    -- require "gitignore"

    -- local DEFAULT_TITLE = "Creating .gitignore: Make your choice(s)"
    -- local winopts = {
    --   prompt = DEFAULT_TITLE,
    -- }
    -- local path = ""
    -- local overwrite = false
    --
    -- vim.ui.select(
    --   gitignore.templateNames,
    --   winopts,
    --   function(selected) gitignore.createGitignoreBuffer(path, { selected }, 0, overwrite) end
    -- )
    local gitignore = require "gitignore"
    local lGenerate = function(opts, sorter_opts)
      local DEFAULT_TITLE = "Creating .gitignore: Make your choice(s)"

      -- get opts.args (path) and opts.bang (force overwrite), if exists, otherwise set to default
      opts = opts or {}
      local path = opts.args or ""
      local overwrite = opts.bang or false

      local ok, Snacks = pcall(require, "snacks")
      if not ok then return nil end

      local items = gitignore.templateNames
      local title = DEFAULT_TITLE
      local completed = false

      local on_choice = function(itemsS)
        vim.print(itemsS)
        if #itemsS == 0 then
          vim.notify("No items selected")
          return
        end
        gitignore.createGitignoreBuffer(path, itemsS, 0, overwrite)
      end

      Snacks.picker.pick {
        source = "select",
        finder = function()
          ---@type snacks.picker.finder.Item[]
          local ret = {}
          for idx, item in ipairs(items) do
            local text = (opts.format_item or tostring)(item)
            ---@type snacks.picker.finder.Item
            local it = type(item) == "table" and setmetatable({}, { __index = item }) or {}
            it.text = idx .. " " .. text
            it.item = item
            it.idx = idx
            ret[#ret + 1] = it
          end
          return ret
        end,
        format = Snacks.picker.format.ui_select {},
        title = title,
        layout = {
          config = function(layout)
            -- Fit list height to number of items, up to 10
            for _, box in ipairs(layout.layout) do
              if box.win == "list" and not box.height then
                box.height = math.max(math.min(#items, vim.o.lines * 0.8 - 10), 2)
              end
            end
          end,
        },
        actions = {
          confirm = function(picker,selected)
            if completed then return end
            completed = true
            local selectedItems = vim.tbl_map(function(el) return el.item end, picker:selected())
            if #selectedItems == 0 then
              selectedItems = {selected}
            end
            picker:close()
            vim.schedule(function() on_choice(selectedItems) end)
          end,
        },
        on_close = function()
          if completed then return end
          completed = true
          vim.schedule(on_choice)
        end,
        -- multi = true,
      }

      -- vim.ui.select(
      --   gitignore.templateNames,
      --   winopts,
      --   function(selected,b)
      --     vim.print(selected)
      --     vim.print(b)
      --     -- gitignore.createGitignoreBuffer(path, { selected }, 0,overwrite)
      --   end
      -- )
    end
    vim.api.nvim_create_user_command("GITI", lGenerate, {
      nargs = "?", -- 0 or 1 arguments
      complete = "file", -- complete with files
      bang = true, -- allow the command to be run with a !
    })

    --  vim.ui.select(gitignore.templateNames, , function(selected)
    --  M.createGitignoreBuffer(path, { selected }, overwrite)
    -- end)
  end,
}
