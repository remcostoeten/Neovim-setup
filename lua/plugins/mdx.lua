return {
  -- MDX syntax highlighting and treesitter support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "markdown",
        "markdown_inline",
        "tsx",
        "typescript",
        "javascript",
        "html",
        "css",
      })
    end,
  },

  -- LSP configuration for MDX
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- TypeScript LSP for JSX/TSX components in MDX
        tsserver = {
          filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "mdx" },
        },
        -- CSS LSP for styling
        cssls = {
          filetypes = { "css", "scss", "less", "mdx" },
        },
        -- HTML LSP for HTML elements
        html = {
          filetypes = { "html", "mdx" },
        },
        -- Tailwind CSS LSP if you use Tailwind
        tailwindcss = {
          filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "mdx" },
        },
      },
    },
  },

  -- File type detection for MDX
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      -- Set up filetype detection for MDX
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
    end,
  },

  -- Enhanced markdown features
  {
    "plasticboy/vim-markdown",
    ft = { "markdown", "mdx" },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_new_list_item_indent = 2
      vim.g.vim_markdown_auto_insert_bullets = 0
      vim.g.vim_markdown_new_list_item_indent = 0
    end,
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "mdx" },
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 1
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = ""
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = ""
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
      }
      vim.g.mkdp_markdown_css = ""
      vim.g.mkdp_highlight_css = ""
      vim.g.mkdp_port = ""
      vim.g.mkdp_page_title = "「${name}」"
      vim.g.mkdp_filetypes = { "markdown", "mdx" }
    end,
  },

  -- Table mode for better table editing
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown", "mdx" },
    config = function()
      vim.g.table_mode_corner = "|"
    end,
  },

  -- Auto-pairs for brackets and quotes
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
          java = false,
        },
      })
    end,
  },

  -- Peek.nvim for live markdown preview
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    ft = { "markdown", "mdx" },
    config = function()
      require("peek").setup({
        auto_load = true,
        close_on_bdelete = true,
        syntax = true,
        theme = "dark",
        update_on_change = true,
        app = "webview",
        filetype = { "markdown", "mdx" },
        throttle_at = 200000,
        throttle_time = "auto",
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  -- Better syntax highlighting for JSX in MDX
  {
    "maxmellon/vim-jsx-pretty",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "mdx" },
  },

  -- Emmet for HTML/JSX completion
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "mdx" },
    config = function()
      vim.g.user_emmet_install_global = 0
      vim.g.user_emmet_leader_key = "<C-Z>"
      vim.cmd([[
        autocmd FileType html,css,javascript,javascriptreact,typescript,typescriptreact,mdx EmmetInstall
      ]])
    end,
  },

  -- Treesitter context for better navigation
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = "outer",
        mode = "cursor",
      })
    end,
  },
}
