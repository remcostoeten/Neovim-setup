-- Markdown Preview Plugin Configuration
-- Add the markdown preview plugin
return {
  -- Other plugin configurations

  -- Markdown Preview Plugin
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && pnpm install",
    setup = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  -- Glow Plugin for in-editor markdown preview
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({
        width = 120,
      })
    end,
  },
}
