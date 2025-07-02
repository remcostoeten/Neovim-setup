-- Paste from Clipboard (Ctrl+V)
-- Pastes content from system clipboard, falling back to vim register if needed

vim.keymap.set({ 'n', 'v' }, '<C-v>', function()
  -- Try to paste from system clipboard first, fallback to unnamed register
  if vim.fn.has('clipboard') == 1 and vim.fn.getreg('+') ~= '' then
    vim.cmd('normal! "+p')
  else
    vim.cmd('normal! p')
  end
end, { desc = 'Paste from clipboard' })

-- Insert mode paste
vim.keymap.set('i', '<C-v>', function()
  -- In insert mode, use different paste command
  if vim.fn.has('clipboard') == 1 and vim.fn.getreg('+') ~= '' then
    return vim.api.nvim_replace_termcodes('<C-r>+', true, false, true)
  else
    return vim.api.nvim_replace_termcodes('<C-r>"', true, false, true)
  end
end, { desc = 'Paste from clipboard in insert mode', expr = true })
