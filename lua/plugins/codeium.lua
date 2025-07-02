-- AI-powered completion with Codeium (free alternative to Copilot)
return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      -- Disable codeium by default (you can enable it with :CodeiumEnable)
      vim.g.codeium_enabled = true
      
      -- Keybindings for Codeium (similar to Copilot)
      vim.keymap.set('i', '<C-g>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, silent = true, desc = "Accept Codeium suggestion" })
      
      vim.keymap.set('i', '<C-;>', function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true, silent = true, desc = "Next Codeium suggestion" })
      
      vim.keymap.set('i', '<C-,>', function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true, silent = true, desc = "Previous Codeium suggestion" })
      
      vim.keymap.set('i', '<C-x>', function()
        return vim.fn['codeium#Clear']()
      end, { expr = true, silent = true, desc = "Clear Codeium suggestion" })
      
      -- Optional: disable codeium for specific filetypes
      -- vim.g.codeium_filetypes = {
      --   ["markdown"] = false,
      --   ["text"] = false,
      -- }
    end,
  },
}
