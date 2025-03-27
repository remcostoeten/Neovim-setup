--[[
  ░█▄░█ █▀▀ █▀█ █░█ █ █▀▄▀█
  ░█░▀█ ██▄ █▄█ ▀▄▀ █ █░▀░█

  Elegant Neovim Configuration with Vercel-inspired aesthetics
]]

-- Bootstrap lazy.nvim, LazyVim, and plugins
require("config.lazy")

-- Source custom commands
require('user.commands')

-- ┌─────────────────────────────────────────────────────────────┐
-- │ Theme Configuration                                         │
-- └─────────────────────────────────────────────────────────────┘
local function setup_vercel_theme()
  local colors = {
    bg = "#000000", -- Pure black background
    fg = "#ECEFF4", -- Slightly off-white for better readability
    comment = "#636e7b", -- Subtle gray for comments
    string = "#98C379", -- Soft green for strings
    number = "#B5CEA8", -- Muted green for numbers
    constant = "#5E81AC", -- Blue for constants
    identifier = "#81A1C1", -- Light blue for identifiers
    func = "#88C0D0", -- Cyan for functions
    statement = "#81A1C1", -- Light blue for statements
    type = "#EBCB8B", -- Yellow for types
    preproc = "#D08770", -- Soft orange for preprocessor
    special = "#B48EAD", -- Purple for special
    error = "#BF616A", -- Red for errors
    error_bg = "#3B4252", -- Dark background for errors
    todo = "#EBCB8B", -- Yellow for todos
    todo_bg = "#434C5E", -- Dark background for todos
    search = "#2E3440", -- Dark background for search
    search_bg = "#88C0D0", -- Cyan background for search
    pmenu = "#ECEFF4", -- White for popup menu text
    pmenu_bg = "#2E3440", -- Dark background for popup menu
    pmenu_sel = "#2E3440", -- Dark text for selected popup item
    pmenu_sel_bg = "#88C0D0", -- Cyan background for selected popup item
    cursor_line = "#1A1A1A", -- Subtle highlight for cursor line
    line_nr = "#4C566A", -- Muted color for line numbers
    line_nr_cur = "#88C0D0", -- Highlight current line number
    split = "#191919", -- Very subtle split lines
    status = "#ECEFF4", -- White for status line text
    status_bg = "#3B4252", -- Dark background for status line
    status_nc = "#D8DEE9", -- Light text for inactive status line
    status_nc_bg = "#2E3440", -- Darker background for inactive status
    visual_bg = "#3B4252", -- Background for visual selection
    purple_hint = "#A569BD", -- Hint of purple
  }

  -- UI Enhancements
  vim.cmd([[
    set guifont=JetBrains\ Mono:h11
    set linespace=3
  ]])

  -- Apply highlights
  local highlights = {
    -- Base
    { "Normal", "guibg=" .. colors.bg .. " guifg=" .. colors.fg },
    { "Comment", "guifg=" .. colors.comment .. " gui=italic" },
    { "NormalFloat", "guibg=" .. colors.pmenu_bg .. " guifg=" .. colors.fg },
    { "FloatBorder", "guibg=" .. colors.pmenu_bg .. " guifg=" .. colors.pmenu_bg },

    -- Syntax
    { "String", "guifg=" .. colors.string },
    { "Number", "guifg=" .. colors.number },
    { "Constant", "guifg=" .. colors.constant },
    { "Identifier", "guifg=" .. colors.identifier },
    { "Function", "guifg=" .. colors.func .. " gui=bold" },
    { "Statement", "guifg=" .. colors.statement },
    { "Type", "guifg=" .. colors.type },
    { "PreProc", "guifg=" .. colors.preproc },
    { "Special", "guifg=" .. colors.special },
    { "Underlined", "guifg=" .. colors.preproc .. " gui=underline" },
    { "Keyword", "guifg=" .. colors.statement .. " gui=bold" },

    -- UI Elements
    { "Error", "guifg=" .. colors.error .. " guibg=" .. colors.error_bg },
    { "Todo", "guifg=" .. colors.todo .. " guibg=" .. colors.todo_bg .. " gui=bold" },
    { "Search", "guifg=" .. colors.search .. " guibg=" .. colors.search_bg },
    { "Pmenu", "guifg=" .. colors.pmenu .. " guibg=" .. colors.pmenu_bg },
    { "PmenuSel", "guifg=" .. colors.pmenu_sel .. " guibg=" .. colors.pmenu_sel_bg },
    { "CursorLine", "guibg=" .. colors.cursor_line },
    { "CursorLineNr", "guifg=" .. colors.line_nr_cur .. " gui=bold" },
    { "LineNr", "guifg=" .. colors.line_nr .. " guibg=" .. colors.bg },
    { "VertSplit", "guifg=" .. colors.split .. " guibg=" .. colors.bg },
    { "StatusLine", "guifg=" .. colors.status .. " guibg=" .. colors.status_bg },
    { "StatusLineNC", "guifg=" .. colors.status_nc .. " guibg=" .. colors.status_nc_bg },
    { "Visual", "guibg=" .. colors.visual_bg },
    { "SignColumn", "guibg=" .. colors.bg },

    -- Git highlighting
    { "DiffAdd", "guibg=#2D3B2D" },
    { "DiffChange", "guibg=#2D3A4F" },
    { "DiffDelete", "guibg=#3B2D2D" },
    { "DiffText", "guibg=#365069" },

    -- LSP
    { "DiagnosticError", "guifg=" .. colors.error },
    { "DiagnosticWarn", "guifg=" .. colors.todo },
    { "DiagnosticInfo", "guifg=" .. colors.func },

    -- Purple hint
    { "Function", "guifg=" .. colors.purple_hint .. " gui=bold" },
    { "Special", "guifg=" .. colors.purple_hint },
    { "Keyword", "guifg=" .. colors.purple_hint .. " gui=bold" },
  }

  for _, highlight in pairs(highlights) do
    vim.cmd(string.format("highlight %s %s", highlight[1], highlight[2]))
  end
end

setup_vercel_theme()

-- Apply the Vercel-inspired theme
setup_vercel_theme()

-- ┌─────────────────────────────────────────────────────────────┐
-- │ Key Mappings - Editor-like Experience                       │
-- └─────────────────────────────────────────────────────────────┘
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File operations
map("n", "<C-x>", 'gg"_dG', opts) -- Clear file (Ctrl+X)
map("n", "<C-a>", "ggVG", opts) -- Select all (Ctrl+A)
map("n", "<C-i>", "ggVG<c-v>", opts) -- Select all and go to Insert mode (Ctrl+I)

-- Clipboard integration
map("v", "<C-c>", '"+y', opts) -- Copy to system clipboard (Ctrl+C in visual mode)
map("n", "<C-c>", '"+y', opts) -- Copy to system clipboard (Ctrl+C in normal mode)
map("i", "<C-c>", '<Esc>"+y', opts) -- Copy to system clipboard (Ctrl+C in insert mode)
map("v", "<C-v>", '"+p', opts) -- Paste from system clipboard (Ctrl+V in visual mode)
map("n", "<C-v>", '"+p', opts) -- Paste from system clipboard (Ctrl+V in normal mode)
map("i", "<C-v>", '<Esc>"+p', opts) -- Paste from system clipboard (Ctrl+V in insert mode)

-- Undo/Redo
map("n", "<C-u>", "<C-r>", opts) -- Redo (Ctrl+U)

-- ┌─────────────────────────────────────────────────────────────┐
-- │ Plugin Configuration                                        │
-- └─────────────────────────────────────────────────────────────┘

-- Change the default key for 'details' in LazyVim
require("lazy.view.config").keys.details = "o"

-- ┌─────────────────────────────────────────────────────────────┐
-- │ Additional Settings                                         │
-- └─────────────────────────────────────────────────────────────┘

-- Enable true color support
vim.opt.termguicolors = true

-- Set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable cursor line highlighting
vim.opt.cursorline = true

-- Set tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Improve search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- UI Enhancements
vim.opt.scrolloff = 8 -- Keep 8 lines visible when scrolling
vim.opt.sidescrolloff = 8 -- Keep 8 columns visible when side-scrolling
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.cmdheight = 1 -- Command line height
vim.opt.pumheight = 10 -- Maximum number of items in popup menu
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.laststatus = 3 -- Global status line
vim.opt.list = true -- Show invisible characters
vim.opt.listchars = { -- How to show invisible characters
  tab = "→ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "␣",
}

-- Better split behavior
vim.opt.splitbelow = true -- Open new splits below
vim.opt.splitright = true -- Open new splits to the right

-- Font settings for GUI
if vim.fn.has("gui_running") == 1 then
  vim.opt.guifont = "JetBrains Mono:h11"
  vim.opt.linespace = 3 -- Increase line spacing for better readability
end

-- Terminal-specific settings
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})