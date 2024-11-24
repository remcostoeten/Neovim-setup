-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Add this to your init.lua
vim.keymap.set("n", "<C-x>", 'gg"_dG', { noremap = true, silent = true })

-- Or if you use init.vim, use this instead:
-- nnoremap <C-x> gg"_dG
