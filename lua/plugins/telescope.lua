-- Telescope (Fuzzy Finder) Configuration
-- *Important*:  If LazyVim provides a `telescope-config.lua` or similar file,
--                you should *not* duplicate the entire Telescope setup here.
--                Instead, load that configuration:
-- require("plugins.telescope-config")  -- Adjust path as needed

-- If you *don't* have a specific telescope-config file provided by LazyVim,
-- then add a *basic* Telescope configuration here:
require("telescope").load_extension("fzf")
