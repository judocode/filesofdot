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
      { "<leader>cx", "<cmd>Trouble lsp_references toggle<cr>", desc = "LSP references (Trouble)" },
    },
  },
}
