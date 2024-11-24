return {
  -- Disable fzf
  { "ibhagwan/fzf-lua", enabled = false },

  -- Configure Telescope with explicit keymaps
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Add keymaps for find file
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      -- Add keymaps for other common actions
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.6 },
      },
    },
  },
}
