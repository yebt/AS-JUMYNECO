-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder

  -- Behaviour
  { import = "astrocommunity.editing-support.treesj" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.workflow.hardtime-nvim" },

  -- IDE
  { import = "astrocommunity.file-explorer.mini-files" },
  -- { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  -- { import = "astrocommunity.project.project-nvim" },
  -- { import = "astrocommunity.project.neoconf-nvim" }, -- already included in astro

  --- Utils
  { import = "astrocommunity.editing-support.amp-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- { import = "astrocommunity.syntax.vim-easy-align" },

  --- LSP
  -- { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.test.neotest" },

  --- UI
  -- { import = "astrocommunity.recipes.picker-nvchad-theme" },
  -- { import = "astrocommunity.recipes.telescope-nvim-snacks" },
  -- { import = "astrocommunity.recipes.disable-borders" },
  -- { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  -- { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  -- { import = "astrocommunity.recipes.heirline-clock-statusline" },
  -- { import = "astrocommunity.recipes.heirline-tabline-buffer-number" },
  -- { import = "astrocommunity.recipes.heirline-vscode-winbar" },

  --- Langs
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  -- { import = "astrocommunity.pack.php" },
  -- { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.pack.astro" },
}
