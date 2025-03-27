-- Custom Commands for Markdown and MDX conversion

-- Command to convert current file to Markdown
vim.api.nvim_create_user_command("Markdown", function()
  vim.cmd("set filetype=markdown")
end, { nargs = 0 })

-- Command to convert current file to MDX
vim.api.nvim_create_user_command("MDX", function()
  vim.cmd("set filetype=mdx")
end, { nargs = 0 })

-- Optionally, you can create a command to toggle Markdown preview
vim.api.nvim_create_user_command("MarkdownPreview", function()
  vim.cmd("MarkdownPreviewToggle")
end, { nargs = 0 })

-- Custom Command for Find and Replace
vim.api.nvim_create_user_command("Find", function(opts)
  local search_term = opts.args
  vim.cmd('let @/ = "' .. search_term .. '"')
  vim.cmd("set hlsearch")
end, { nargs = 1, complete = "customlist,v:lua.vim.fn.searchcomplete" })

