-- Bootstrap lazy.nvim, LazyVim, and plugins
require("config.lazy")
-- Source custom commands
require("user.commands")

-- Source configuration settings
require("config.settings")

-- Source key mappings
require("config.keymaps")

-- Source theme configuration
require("config.theme")

-- Source plugin configurations
require("plugins.telescope")
require("plugins.lualine")
require("plugins.bufferline")
require("plugins.markdown")

-- Apply the Vercel-inspired theme
setup_vercel_theme()
