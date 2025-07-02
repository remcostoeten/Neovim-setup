# MDX Neovim Setup

Your Neovim is now configured with a comprehensive MDX editing experience! Here's what's been added:

## 🚀 Features

### Syntax Highlighting & LSP
- **Treesitter**: Full syntax highlighting for MDX, TypeScript, JavaScript, HTML, CSS
- **LSP Support**: TypeScript, CSS, HTML, and Tailwind CSS language servers
- **File Type Detection**: Automatic `.mdx` file recognition

### Preview & Live Editing
- **Markdown Preview**: Traditional markdown preview in browser
- **Peek.nvim**: Live preview with Deno-powered rendering
- **Real-time Updates**: Auto-refresh on file changes

### Enhanced Editing
- **Auto-pairs**: Smart bracket and quote completion
- **Table Mode**: Easy table creation and editing
- **Emmet**: HTML/JSX expansion with `<C-Z>` leader
- **Treesitter Context**: Shows current function/component context

### Snippets
Comprehensive snippet collection for common MDX patterns:
- `fm` - Frontmatter template
- `imp` - Import statement
- `comp` - React component
- `jsx` - JSX expression block
- `code` - Code block with syntax highlighting
- `alert` - Alert/callout component
- `table` - Markdown table
- `div` - Div with className
- `frag` - React fragment
- And many more!

## ⌨️ Key Bindings

### Preview Commands
- `<leader>mp` - Start Markdown Preview
- `<leader>ms` - Stop Markdown Preview  
- `<leader>mt` - Toggle Markdown Preview
- `<leader>po` - Open Peek Preview
- `<leader>pc` - Close Peek Preview

### Table Editing
- `<leader>tm` - Toggle Table Mode

### Quick Insertions (Insert Mode)
- `<C-j>` - Insert `<div></div>` 
- `<C-k>` - Insert React Fragment `<></>`
- `<C-Z>` + emmet abbreviation - Expand HTML/JSX

### Text Formatting (Visual Mode)
- `<leader>mb` - Make selection **bold**
- `<leader>mi` - Make selection *italic*
- `<leader>mc` - Make selection `code`

## 🎨 Editor Settings

When editing MDX files, the following settings are automatically applied:
- **Indentation**: 2 spaces (standard for React/JSX)
- **Spell Check**: Enabled for prose content
- **Word Wrap**: Enabled with smart line breaking
- **Conceal Level**: 2 (hides markdown syntax for cleaner reading)

## 🔧 Plugins Installed

1. **nvim-treesitter** - Syntax highlighting
2. **nvim-lspconfig** - Language server integration  
3. **plasticboy/vim-markdown** - Enhanced markdown features
4. **iamcco/markdown-preview.nvim** - Browser preview
5. **toppair/peek.nvim** - Live preview with Deno
6. **dhruvasagar/vim-table-mode** - Table editing
7. **windwp/nvim-autopairs** - Auto-pairing
8. **maxmellon/vim-jsx-pretty** - JSX syntax highlighting
9. **mattn/emmet-vim** - HTML/JSX expansion
10. **nvim-treesitter-context** - Context display

## 📝 Usage Tips

1. **Start with frontmatter**: Type `fm` and press Tab for a frontmatter template
2. **Preview while writing**: Use `<leader>po` to open live preview
3. **Table creation**: Enable table mode with `<leader>tm`, then type `|` to start tables
4. **Component creation**: Type `comp` and Tab for a React component template
5. **Quick JSX**: Use `<C-j>` and `<C-k>` for quick HTML/JSX insertion
6. **Emmet expansion**: Type HTML/JSX shortcuts and press `<C-Z>,` to expand

## 🔄 Next Steps

1. Restart Neovim to load all plugins
2. Run `:Lazy sync` to install/update all plugins
3. Open an `.mdx` file to test the setup
4. Try the preview commands and snippets

Enjoy your enhanced MDX editing experience! 🎉
