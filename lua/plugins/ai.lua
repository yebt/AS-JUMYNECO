return {

  {
    "zbirenbaum/copilot.lua",
    requires = {
      "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
    },
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 15,
        trigger_on_accept = true,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
          toggle_auto_trigger = false,
        },
      },
    },
    cmd = "Copilot",
    event = "InsertEnter",
    -- config = function() require("copilot").setup {} end,
    -- keys = {
    --
    -- }
  },

  -- {
  --   "github/copilot.vim",
  --   -- opts = {},
  --   -- config = false,
  --   -- cmd = {
  --   --   "Copilot",
  --   -- },
  --   event = { "VeryLazy" },
  --   init = function() vim.g.copilot_no_tab_map = true end,
  --   keys = {
  --     {
  --       "<M-j>",
  --       "copilot#Accept('')",
  --       expr = true,
  --       silent = true,
  --       mode = "i",
  --       script = true,
  --     },
  --   },
  --   lazy = false,
  -- },

  -- Amp integration
  {
    "sourcegraph/amp.nvim",
    branch = "main",
    lazy = true,
    opts = { auto_start = true, log_level = "info" },
    config = function(_, opts)
      require("amp").setup(opts)
      -- Send a quick message to the agent
      vim.api.nvim_create_user_command("AmpSend", function(opts)
        local message = opts.args
        if message == "" then
          print "Please provide a message to send"
          return
        end

        local amp_message = require "amp.message"
        amp_message.send_message(message)
      end, {
        nargs = "*",
        desc = "Send a message to Amp",
      })

      -- Send entire buffer contents
      vim.api.nvim_create_user_command("AmpSendBuffer", function(opts)
        local buf = vim.api.nvim_get_current_buf()
        local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
        local content = table.concat(lines, "\n")

        local amp_message = require "amp.message"
        amp_message.send_message(content)
      end, {
        nargs = "?",
        desc = "Send current buffer contents to Amp",
      })

      -- Add selected text directly to prompt
      vim.api.nvim_create_user_command("AmpPromptSelection", function(opts)
        local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)
        local text = table.concat(lines, "\n")

        local amp_message = require "amp.message"
        amp_message.send_to_prompt(text)
      end, {
        range = true,
        desc = "Add selected text to Amp prompt",
      })

      -- Add file+selection reference to prompt
      vim.api.nvim_create_user_command("AmpPromptRef", function(opts)
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname == "" then
          print "Current buffer has no filename"
          return
        end

        local relative_path = vim.fn.fnamemodify(bufname, ":.")
        local ref = "@" .. relative_path
        if opts.line1 ~= opts.line2 then
          ref = ref .. "#L" .. opts.line1 .. "-" .. opts.line2
        elseif opts.line1 > 1 then
          ref = ref .. "#L" .. opts.line1
        end

        local amp_message = require "amp.message"
        amp_message.send_to_prompt(ref)
      end, {
        range = true,
        desc = "Add file reference (with selection) to Amp prompt",
      })
    end,

    cmd = {
      "AmpSend",
      "AmpSendBuffer",
      "AmpPromptSelection",
      "AmpPromptRef",
    },
  },
}
