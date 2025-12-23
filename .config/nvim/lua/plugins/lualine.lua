return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_c = {
      {
        "filename",
        path = 1, -- 0 filename, 1 relative path, 2 absolute
        shorting_target = 0, -- disable path shortening
      },
    }
  end,
}
