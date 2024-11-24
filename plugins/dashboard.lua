return {
  "nvimdev/dashboard-nvim",
  opts = {
    theme = "doom",
    config = {
      center = {
        {
          action = "Telescope find_files",
          desc = " Find file",
          icon = " ",
          key = "f",
        },
        {
          action = "ene | startinsert",
          desc = " New file",
          icon = " ",
          key = "n",
        },
        {
          action = "Telescope oldfiles",
          desc = " Recent files",
          icon = " ",
          key = "r",
        },
        {
          action = "Telescope live_grep",
          desc = " Find text",
          icon = " ",
          key = "g",
        },
        {
          action = "e $MYVIMRC",
          desc = " Config",
          icon = " ",
          key = "c",
        },
      },
    },
  },
}
