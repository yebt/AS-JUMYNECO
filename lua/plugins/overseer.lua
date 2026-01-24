return {
  { "stevearc/overseer.nvim" },
  {

    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        commands_for_angular = {
          {
            event = { "BufEnter", "DirChanged" },
            group = "AngularCommands",
            callback = function()
              --
              local function find_angular_root(start)
                return vim.fs.find("angular.json", { upward = true, path = start })[1]
              end
              --
              local function create_ng_command()
                if vim.fn.exists ":NgComponent" == 2 then return end

                vim.api.nvim_create_user_command("NgComponent", function()
                  --

                  local overseer = require "overseer"
                  local snacks = require "snacks"

                  local base_dir = "src/app"

                  -- local dirs = vim.fn.systemlist "fd --type d --color never -E .git "
                  local result = vim
                    .system({ "fd", "--type", "d", "-E", ".git", "--strip-cwd-prefix", "--full-path", base_dir }, {
                      -- cwd = vim.fn.getcwd() .. "/" .. base_dir,
                      text = true,
                    })
                    :wait()

                  local dirs = vim.split(result.stdout, "\n", { trimempty = true })

                  local dirs_items = vim.fn.map(dirs, function(_, el) return el:gsub(base_dir .. "/", "") end)

                  snacks.picker.select(dirs_items, {}, function(selected_dir)
                    if not selected_dir then
                      vim.notify "No path selected"
                      return
                    end

                    vim.ui.input({ prompt = "Component Name" }, function(component_name)
                      if not component_name or #component_name == 0 then
                        vim.notify "No name selected"
                        return
                      end

                      local result_name = selected_dir .. component_name

                      -- Run the main task
                      local task_ngcg = overseer.new_task {
                        cmd = "ng",
                        args = {
                          "generate",
                          "component",
                          result_name,
                          "--skip-tests",
                          "--style=none",
                          "--type=component",
                        },
                        -- components = {},
                      }
                      --
                      task_ngcg:subscribe("on_complete", function(_task, status, result)
                        --
                        print("Task", task_ngcg.name, "finished with status", status)
                      end)

                      task_ngcg:start()
                    end)
                  end)

                  --
                end, {
                  desc = "Angular: generate component",
                })
              end

              local root = find_angular_root(vim.fn.getcwd())
              if root then create_ng_command() end
            end,
          },
        },
      },
      -- commands = {
      --   NgGenComponent = {
      --     function() end,
      --     desc = "NG: Gen Component ns",
      --   },
      -- },
    },
  },
}
