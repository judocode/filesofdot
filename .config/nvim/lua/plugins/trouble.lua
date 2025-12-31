return {
  {
    "folke/trouble.nvim",
    opts = {
      multi_line = true,
      auto_refresh = false,
      auto_preview = false,
      focus = true,
      win = {
        wo = {
          wrap = true,
        },
      },
      modes = {
        lsp = {
          win = {
            position = "bottom",
          },
        },
      },
    },
  },
}
