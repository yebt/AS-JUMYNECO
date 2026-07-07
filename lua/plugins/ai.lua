---

---@type LazySpec
return {

  {
    "github/copilot.vim",
    event = "VeryLazy",
    cmd = "Copilot",
    keys = {
      {
        "<M-l>",
        'copilot#Accept("\\<CR>")',
        mode = "i",
        silent = true,
        replace_keycodes = false,
        expr = true,
        desc = "Accept Copilot suggestion",
      },
    },
  },

  -- {
  --   "yetone/avante.nvim",
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   -- ⚠️ must add this setting! ! !
  --   build = "make",
  --   -- event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   ---@module 'avante'
  --   -- ---@type avante.Config
  --   opts = {
  --     -- provider = "kimi-cli",
  --     provider = "moonshot",
  --     providers = {
  --       moonshot = {
  --         endpoint = "https://api.kimi.com/coding/v1",
  --         model = "kimi-k2.7-code",
  --         timeout = 30000, -- Timeout in milliseconds
  --         extra_request_body = {
  --           temperature = 1,
  --           -- max_tokens = 32768,
  --         },
  --         -- api_key = vim.env.
  --       },
  --     },
  --     selector = {
  --       provider = "snacks",
  --     },
  --     input = {
  --       provider = "snacks",
  --       provider_opts = {
  --         -- Additional snacks.input options
  --         title = "Avante Input",
  --         icon = " ",
  --       },
  --     },
  --     -- acp_providers = {
  --     --
  --     -- },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     -- "nvim-mini/mini.pick", -- for file_selector provider mini.pick
  --     -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     -- "stevearc/dressing.nvim", -- for input provider dressing
  --     -- "folke/snacks.nvim", -- for input provider snacks
  --     -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     -- "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },

  -- {
  --   "yetone/avante.nvim",
  --   opts = {
  --     -- provider = "kimi-cli",
  --     provider = "moonshot",
  --     providers = {
  --       moonshot = {
  --         endpoint = "https://api.kimi.com/coding/v1",
  --         model = "kimi-k2.7-code",
  --         timeout = 30000, -- Timeout in milliseconds
  --         extra_request_body = {
  --           temperature = 1,
  --           -- max_tokens = 32768,
  --         },
  --         -- api_key = vim.env.
  --       },
  --     },
  --     selector = {
  --       provider = "snacks",
  --     },
  --     input = {
  --       provider = "snacks",
  --       provider_opts = {
  --         -- Additional snacks.input options
  --         title = "Avante Input",
  --         icon = " ",
  --       },
  --     },
  --     -- acp_providers = {
  --     --
  --     -- },
  --   },
  --
  -- }

  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     -- Add mcphub.nvim as a dependency
  --     "ravitemer/mcphub.nvim",
  --   },
  --   ---@module 'codecompanion'
  --   opts = {
  --
  --     triggers = {
  --       acp_slash_commands = "\\",
  --       editor_context = "#",
  --       slash_commands = "/",
  --       tools = "@",
  --     },
  --
  --     adapters = {
  --       http = {
  --         kmc = function()
  --           -- local base_url = "https://api.moonshot.ai/v1"
  --           local base_url = "https://api.kimi.com/coding/v1" -- Open ai compatible
  --           -- local base_url = "https://api.kimi.com/coding" -- claude compatible
  --           return require("codecompanion.adapters").extend("openai_compatible", {
  --             url = base_url .. "/chat/completions",
  --             env = {
  --               api_key = vim.env.MOONSHOT_API_KEY,
  --             },
  --             schema = {
  --               model = {
  --                 default = "kimi-k2.7-code",
  --               },
  --             },
  --           })
  --         end,
  --
  --         -- kimicode = function()
  --         --   return require("codecompanion.adapters").extend("kimicode", {
  --         --     env = {
  --         --       -- api_key = vim.env.MOONSHOT_API_KEY,
  --         --       endpoint = "https://api.kimi.com/coding/v1",
  --         --     },
  --         --     schema = {
  --         --       model = {
  --         --         default = "kimi-k2.7-code",
  --         --       },
  --         --     },
  --         --   })
  --         -- end,
  --       },
  --     },
  --
  --     interactions = {
  --       chat = {
  --         adapter = "kmc",
  --         opts = {
  --           completion_provider = "blink",
  --         },
  --       },
  --       inline = {
  --         adapter = "kmc",
  --       },
  --       cmd = {
  --         adapter = "kmc",
  --       },
  --       background = {
  --         adapter = "kmc",
  --       },
  --     },
  --
  --     display = {
  --       chat = {
  --
  --         roles = {
  --           ---The header name for the LLM's messages
  --           ---@type string|fun(adapter: CodeCompanion.Adapter): string
  --           llm = function(adapter) return "CodeCompanion (" .. adapter.formatted_name .. ")" end,
  --
  --           ---The header name for your messages
  --           ---@type string
  --           user = "Me",
  --         },
  --
  --         fold_reasoning = false,
  --         show_reasoning = false,
  --         icons = {
  --           buffer_sync_all = "󰪴 ",
  --           buffer_sync_diff = " ",
  --           chat_context = " ",
  --           chat_fold = " ",
  --           tool_pending = "  ",
  --           tool_in_progress = "  ",
  --           tool_failure = "  ",
  --           tool_success = "  ",
  --         },
  --       },
  --       diff = {
  --         enabled = true,
  --
  --         -- At or below this diff size, always display the diff in the chat buffer
  --         threshold_for_chat = 6,
  --
  --         word_highlights = {
  --           additions = true,
  --           deletions = true,
  --         },
  --       },
  --     },
  --
  --     extensions = {
  --       mcphub = {
  --         callback = "mcphub.extensions.codecompanion",
  --         opts = {
  --           make_vars = true,
  --           make_slash_commands = true,
  --           show_result_in_chat = true,
  --         },
  --       },
  --     },
  --
  --     prompt_library = {
  --       ["Explain Code"] = {
  --         interaction = "chat",
  --         description = "Explain how code works",
  --         prompts = {
  --           {
  --             role = "system",
  --             content = "You are an expert programmer who excels at explaining code clearly and concisely.",
  --           },
  --           {
  --             role = "user",
  --             content = function(context)
  --               local text = require("codecompanion.helpers.code").get_code(context.start_line, context.end_line)
  --               return "Please explain the following code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```"
  --             end,
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },

  {
    "ThePrimeagen/99",
    config = function()
      local _99 = require "99"

      -- For logging that is to a file if you wish to trace through requests
      -- for reporting bugs, i would not rely on this, but instead the provided
      -- logging mechanisms within 99.  This is for more debugging purposes
      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)
      _99.setup {
        -- provider = _99.Providers.ClaudeCodeProvider,  -- default: OpenCodeProvider
        logger = {
          level = _99.DEBUG,
          path = "/tmp/" .. basename .. ".99.debug",
          print_on_error = true,
        },
        -- When setting this to something that is not inside the CWD tools
        -- such as claude code or opencode will have permission issues
        -- and generation will fail refer to tool documentation to resolve
        -- https://opencode.ai/docs/permissions/#external-directories
        -- https://code.claude.com/docs/en/permissions#read-and-edit
        tmp_dir = "./tmp",

        --- Completions: #rules and @files in the prompt buffer
        completion = {
          -- I am going to disable these until i understand the
          -- problem better.  Inside of cursor rules there is also
          -- application rules, which means i need to apply these
          -- differently
          -- cursor_rules = "<custom path to cursor rules>"

          --- A list of folders where you have your own SKILL.md
          --- Expected format:
          --- /path/to/dir/<skill_name>/SKILL.md
          ---
          --- Example:
          --- Input Path:
          --- "scratch/custom_rules/"
          ---
          --- Output Rules:
          --- {path = "scratch/custom_rules/vim/SKILL.md", name = "vim"},
          --- ... the other rules in that dir ...
          ---
          custom_rules = {
            "scratch/custom_rules/",
          },

          --- Configure @file completion (all fields optional, sensible defaults)
          files = {
            -- enabled = true,
            -- max_file_size = 102400,     -- bytes, skip files larger than this
            -- max_files = 5000,            -- cap on total discovered files
            -- exclude = { ".env", ".env.*", "node_modules", ".git", ... },
          },
          --- File Discovery:
          --- - In git repos: Uses `git ls-files` which automatically respects .gitignore
          --- - Non-git repos: Falls back to filesystem scanning with manual excludes
          --- - Both methods apply the configured `exclude` list on top of gitignore

          --- What autocomplete engine to use. Defaults to native (built-in) if not specified.
          source = "native", -- "native" (default), "cmp", or "blink"
        },

        --- WARNING: if you change cwd then this is likely broken
        --- ill likely fix this in a later change
        ---
        --- md_files is a list of files to look for and auto add based on the location
        --- of the originating request.  That means if you are at /foo/bar/baz.lua
        --- the system will automagically look for:
        --- /foo/bar/AGENT.md
        --- /foo/AGENT.md
        --- assuming that /foo is project root (based on cwd)
        md_files = {
          "AGENT.md",
        },
      }

      -- take extra note that i have visual selection only in v mode
      -- technically whatever your last visual selection is, will be used
      -- so i have this set to visual mode so i dont screw up and use an
      -- old visual selection
      --
      -- likely ill add a mode check and assert on required visual mode
      -- so just prepare for it now
      vim.keymap.set("v", "<leader>9v", function() _99.visual() end)

      --- if you have a request you dont want to make any changes, just cancel it
      vim.keymap.set("n", "<leader>9x", function() _99.stop_all_requests() end)

      vim.keymap.set("n", "<leader>9s", function() _99.search() end)
    end,
  },
}
