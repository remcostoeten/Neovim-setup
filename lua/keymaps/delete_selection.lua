-- Delete Selection (Ctrl+X)
-- Deletes the current selection without overwriting clipboard/yank register

vim.keymap.set('v', '<C-x>', function()
  -- Delete selection to black hole register to avoid overwriting clipboard
  vim.cmd('normal! "_d')
end, { desc = 'Delete selection without yanking' })

-- Also work in normal mode to delete current line
vim.keymap.set('n', '<C-x>', function()
  -- Delete current line to black hole register
  vim.cmd('normal! "_dd')
end, { desc = 'Delete current line without yanking' })
