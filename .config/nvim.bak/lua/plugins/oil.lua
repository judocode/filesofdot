return {
  'stevearc/oil.nvim',
  cmd = 'Oil',                 -- Lazy-load when :Oil command is run
  keys = { '-', '<Leader>o' }, -- Lazy-load on '-' key press (adjust as needed)
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('oil').setup {
      columns = { 'icons' },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          return name == '.DS_Store'
        end
      }
    }

    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    vim.keymap.set('n', '<leader>-', require('oil').toggle_float)

    -- Open selected file in horizontal split
    vim.cmd [[
        autocmd FileType oil nnoremap <buffer> <leader>sh :sp<CR>:OilOpen<CR>
      ]]

    -- Open selected file in vertical split
    vim.cmd [[
        autocmd FileType oil nnoremap <buffer> <leader>sv :vsp<CR>:OilOpen<CR>
      ]]
  end,
}
