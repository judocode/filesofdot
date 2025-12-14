return {
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.config
    opts = {
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "normal",
      },
      cmdline = {
        keymap = { preset = "inherit" },
        completion = { menu = { auto_show = true } },
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
          treesitter_highlighting = true,
          update_delay_ms = 50,
          window = { border = "rounded" },
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
          max_items = 2,
        },
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
            treesitter = { "lsp" },
          },
          auto_show = true,
          auto_show_delay_ms = 300,
        },
        trigger = { show_in_snippet = false },
      },

      signature = {
        enabled = true,
        window = { border = "rounded", show_documentation = false },
      },

      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "lazydev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 1000,
          },
          lsp = {
            min_keyword_length = 2,
            score_offset = 0,
          },
          path = {
            min_keyword_length = 1,
          },
          snippets = {
            min_keyword_length = 2,
          },
          buffer = {
            min_keyword_length = 4,
            max_items = 5,
          },
        },
      },
    },
  },
}
