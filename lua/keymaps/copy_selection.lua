-- Copy Selection (Ctrl+C)
-- Copies the current selection to both system clipboard and vim register

vim.keymap.set('v', '<C-c>', function()
  -- Yank to both unnamed register and system clipboard
  vim.cmd('normal! y')
  -- Also copy to system clipboard if available
  if vim.fn.has('clipboard') == 1 then
    vim.cmd('normal! "+y')
  end
end, { desc = 'Copy selection to clipboard' })

-- Also work in normal mode to copy current line
vim.keymap.set('n', '<C-c>', function()
  -- Yank current line to both registers
  vim.cmd('normal! yy')
  if vim.fn.has('clipboard') == 1 then
    vim.cmd('normal! "+yy')
  end
end, { desc = 'Copy current line to clipboard' })
