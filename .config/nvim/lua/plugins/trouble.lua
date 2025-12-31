return {
  {
    "folke/trouble.nvim",
    opts = {
      multi_line = true,
      auto_refresh = false,
      auto_preview = false,
      auto_open = false,
      focus = true,
      preview = {
        type = "float",
        scratch = true,
      },
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
    keys = {
      {
        "<leader>cS",
        function()
          require("trouble").toggle({ mode = "lsp_references" })
        end,
        desc = "Toggle LSP References (Trouble)",
      },
    },
  },
}
