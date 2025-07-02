return {
  {
    "LazyVim/LazyVim",
    opts = {
      autocmds = {
        mdx_setup = {
          {
            event = "FileType",
            pattern = { "mdx", "markdown" },
            callback = function()
              local opts = { buffer = true }
              
              -- MDX-specific keymaps
              vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", vim.tbl_extend("force", opts, { desc = "Markdown Preview" }))
              vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", vim.tbl_extend("force", opts, { desc = "Markdown Preview Stop" }))
              vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", vim.tbl_extend("force", opts, { desc = "Markdown Preview Toggle" }))
              
              -- Peek.nvim keymaps
              vim.keymap.set("n", "<leader>po", "<cmd>PeekOpen<cr>", vim.tbl_extend("force", opts, { desc = "Peek Open" }))
              vim.keymap.set("n", "<leader>pc", "<cmd>PeekClose<cr>", vim.tbl_extend("force", opts, { desc = "Peek Close" }))
              
              -- Table mode toggle
              vim.keymap.set("n", "<leader>tm", "<cmd>TableModeToggle<cr>", vim.tbl_extend("force", opts, { desc = "Table Mode Toggle" }))
              
              -- Quick JSX component insertion
              vim.keymap.set("i", "<C-j>", "<div></div><Esc>F>a", vim.tbl_extend("force", opts, { desc = "Insert div" }))
              vim.keymap.set("i", "<C-k>", "<></><Esc>F>a", vim.tbl_extend("force", opts, { desc = "Insert React Fragment" }))
              
              -- Quick markdown formatting
              vim.keymap.set("v", "<leader>mb", "c**<C-r>\"**<Esc>", vim.tbl_extend("force", opts, { desc = "Bold selection" }))
              vim.keymap.set("v", "<leader>mi", "c*<C-r>\"*<Esc>", vim.tbl_extend("force", opts, { desc = "Italic selection" }))
              vim.keymap.set("v", "<leader>mc", "c`<C-r>\"`<Esc>", vim.tbl_extend("force", opts, { desc = "Code selection" }))
              
              -- Set up better indentation for MDX
              vim.bo.shiftwidth = 2
              vim.bo.tabstop = 2
              vim.bo.softtabstop = 2
              vim.bo.expandtab = true
              
              -- Enable spell checking for markdown content
              vim.wo.spell = true
              vim.bo.spelllang = "en_us"
              
              -- Better wrapping for prose
              vim.wo.wrap = true
              vim.wo.linebreak = true
              vim.wo.breakindent = true
              
              -- Conceal level for better readability
              vim.wo.conceallevel = 2
            end,
          },
        },
      },
    },
  },
}
