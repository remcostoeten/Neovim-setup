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
