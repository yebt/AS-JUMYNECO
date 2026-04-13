-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder


  --- Behaviours
  { import = "astrocommunity.workflow.hardtime-nvim" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.code-runner.overseer-nvim" },

  --- Renders
  -- { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  -- { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },

  --- Renders
  { import = "astrocommunity.colorscheme.catppuccin" },

  --- Langs
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" }, --- allow jsonchema in yml
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.angular" },

  { import = "astrocommunity.pack.markdown" },
}
