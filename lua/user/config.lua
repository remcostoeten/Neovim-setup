-- lua/user/config.lua

--[[ Theme Configuration ]]
vim.cmd[[colorscheme tokyonight]]

require("tokyonight").setup({
    style = "storm",
    transparent = true,
    terminal_colors = true,
})

require("nvim-transparent").setup({
    enable_term = true,
    extra_groups = {
        "Normal",
        "NormalNC",
        "SignColumn",
        "LineNr",
        "CursorLineNr",
        "VertSplit",
        "StatusLine",
        "StatusLineNC",
        "Visual",
        "Folded",
        "WinBar",
        "WinBarNC",
    },
})

--[[ nvim-tree Configuration ]]
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local nvim_tree_is_open = false
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.api.nvim_buf_get_name(buf):match("NvimTree_") then
                nvim_tree_is_open = true
                break
            end
        end

        if vim.fn.argc() == 1 and not nvim_tree_is_open then
            require("nvim-tree").find_file()
            vim.cmd("NvimTreeFocus") -- Focus if already open, else open
        end
    end,
})

vim.keymap.set("n", "<leader>nt", "<cmd>NvimTreeToggle<cr>", {
    desc = "Toggle File Tree",
})
vim.keymap.set("n", "<leader>nf", "<cmd>NvimTreeFindFile<cr>", {
    desc = "Find Current File in Tree",
})

--[[ Telescope (Fuzzy Finder) Configuration ]]
-- *Important*:  If LazyVim provides a `telescope-config.lua` or similar file,
--                you should *not* duplicate the entire Telescope setup here.
--                Instead, load that configuration:
-- require("plugins.telescope-config")  -- Adjust path as needed

-- If you *don't* have a specific telescope-config file provided by LazyVim,
-- then add a *basic* Telescope configuration here:
require("telescope").load_extension("fzf")

--[[ lualine Configuration ]]
-- lualine setup code or require statement, adapt from LazyVim's defaults
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      bufferline = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      headaline = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'searchcount'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--[[ bufferline Configuration ]]
require("bufferline").setup{}

-- Add indentation Configuration
require("indent_blankline").setup {}

--[[ Markdown Preview Plugin Configuration ]]
-- Add the markdown preview plugin
return {
    -- Other plugin configurations

    -- Markdown Preview Plugin
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        setup = function()
            vim.g.mkdp_auto_start = 1
        end,
    },

    -- Glow Plugin for in-editor markdown preview
    {
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup({
                width = 120,
            })
        end,
    },
}

-- Keybindings for Markdown Preview
vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mg", ":Glow<CR>", { noremap = true, silent = true })