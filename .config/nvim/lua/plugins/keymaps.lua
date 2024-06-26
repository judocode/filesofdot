-- Navigation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")
vim.keymap.set('x', '<leader>p', '"_dP')
--vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>ww', '<C-w>w')
vim.keymap.set('n', '<C-s>', '<Esc>:w<CR>')
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>')

-- Function to move current buffer to a new horizontal split
function MoveToHSplit()
  -- Get the current buffer number
  local current_buf = vim.api.nvim_get_current_buf()

  -- Get the previous buffer number
  local previous_buf = vim.fn.bufnr('#')

  -- Create a new horizontal split
  vim.cmd('split')

  -- Move the previous buffer to the new window
  vim.api.nvim_win_set_buf(0, previous_buf)

  -- Switch back to the original window
  vim.cmd('wincmd p')

  -- Set the current buffer in the original window
  vim.api.nvim_win_set_buf(0, current_buf)
end

-- Function to move current buffer to a new vertical split
function MoveToVSplit()
  local current_buf = vim.api.nvim_get_current_buf()

  -- Get the previous buffer number
  local previous_buf = vim.fn.bufnr('#')

  -- Create a new vertical split
  vim.cmd('vsplit')

  -- Move the previous buffer to the new window
  vim.api.nvim_win_set_buf(0, previous_buf)

  -- Switch back to the original window
  vim.cmd('wincmd p')

  -- Set the current buffer in the original window
  vim.api.nvim_win_set_buf(0, current_buf)
end

-- Key mapping for moving buffer to horizontal split
vim.api.nvim_set_keymap('n', '<leader>mh', ':lua MoveToHSplit()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mv', ':lua MoveToVSplit()<CR>', { noremap = true, silent = true })

