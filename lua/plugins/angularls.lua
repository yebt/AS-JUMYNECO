return {
  {
    "joeveiga/ng.nvim",
    lazy = true,
  },

  {
    "AstroNvim/astrolsp",

    ---@type AstroLSPOpts
    opts = {

      ---@diagnostic disable: missing-fields
      config = {
        -- clangd = { capabilities = { offsetEncoding = "utf-8" } },
        -- intelephense = {},
        angularls = {
          -- on_attach = function(client, bufnr)
          on_attach = function(_, _)
            local ng = require "ng"
            vim.keymap.set(
              "n",
              "<leader>At",
              ng.goto_template_for_component,
              { desc = "NG: Go to template for component", noremap = true }
            )
            vim.keymap.set("n", "<leader>Ac", ng.goto_component_with_template_file, {
              desc = "NG: Go to component with template",
              noremap = true,
            })
            vim.keymap.set("n", "<leader>AT", ng.get_template_tcb, {})

            -- vim.lsp.commands["angular.goToComponentWithTemplateFile"] = function(command, ctx)
            vim.lsp.commands["angular.goToComponentWithTemplateFile"] = function(_, _)
              ng.goto_component_with_template_file {}
            end

            vim.lsp.commands["angular.goToTemplateForComponent"] = function(_, _)
              --
              ng.goto_template_for_component {}
            end

            vim.lsp.commands["angular.applyCompletionCodeAction"] = function(command, ctx)
              -- El servidor de Angular envuelve el WorkspaceEdit en: arguments -> [1] -> [1]
              -- Basado en tu print: command.arguments[1][1] contiene el campo 'changes'
              local args = command.arguments
              if not args or not args[1] or not args[1][1] then return end

              local workspace_edit = args[1][1]

              -- Verificamos si contiene 'changes' o 'documentChanges' (estándar LSP)
              if workspace_edit.changes or workspace_edit.documentChanges then
                -- Aplicamos el edit. El client_id ayuda a Neovim a saber qué offset_encoding usar
                local client = vim.lsp.get_client_by_id(ctx.client_id)
                local offset_encoding = client and client.offset_encoding or "utf-16"

                vim.lsp.util.apply_workspace_edit(workspace_edit, offset_encoding)
              else
                vim.notify("Angular: No se encontraron cambios para aplicar", vim.log.levels.DEBUG)
              end
            end
          end,
        },
      },
    },
  },
}
