-- Select All (Ctrl+A)
-- Selects the entire content of the current buffer

vim.keymap.set({ 'n', 'v', 'i' }, '<C-a>', function()
  -- Go to normal mode first if in insert mode
  if vim.fn.mode() == 'i' then
    vim.cmd('stopinsert')
  end
  
  -- Select all content
  vim.cmd('normal! ggVG')
end, { desc = 'Select all content in buffer' })
