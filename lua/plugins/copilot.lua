return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          dismiss = "<Esc>",
          next = "<Down>",
          prev = "<Up>",
        },
      },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}
