return {
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },
  {
    "saghen/blink.cmp",
    opts = {
      term = {
        sources = {
          default = {
            "lsp",
            -- "path",
            -- "snippets"
            "buffer",
          },
          transform_items = function(_, items)
            return vim.tbl_filter(function(item)
              return item.kind ~= require("blink.cmp.types").CompletionItemKind.Snippet
            end, items)
          end,
          providers = {
            snippets = {
              opts = {
                enabled = false,
                friendly_snippets = false,
              },
            },
          },
        },
      },
      completion = {
        trigger = {
          show_on_blocked_trigger_characters = { "." },
        },
        menu = {
          auto_show = true,
          auto_show_delay_ms = 250,
        },
        list = {
          max_items = 4,
        },
      },
    },
  },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-dawn",
    },
  },
}
