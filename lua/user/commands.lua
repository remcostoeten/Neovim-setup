-- Custom Commands for Markdown and MDX conversion

-- Command to convert current file to Markdown
vim.api.nvim_create_user_command('Markdown', function()
    vim.cmd('set filetype=markdown')
end, { nargs = 0 })

-- Command to convert current file to MDX
vim.api.nvim_create_user_command('MDX', function()
    vim.cmd('set filetype=mdx')
end, { nargs = 0 })

-- Optionally, you can create a command to toggle Markdown preview
vim.api.nvim_create_user_command('MarkdownPreview', function()
    vim.cmd('MarkdownPreviewToggle')
end, { nargs = 0 })