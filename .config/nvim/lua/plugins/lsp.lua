return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        tl_ls = {
          enabled = false,
        },
        tsserver = {
          enabled = false,
        },
        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 16384,
              },
            },
          },
        },
      },
    },
  },
}
