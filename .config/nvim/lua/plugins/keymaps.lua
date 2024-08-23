-- Navigation
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('x', '<leader>p', '"_dP')
--vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>ww', '<C-w>w')
vim.keymap.set('n', '<C-s>', '<Esc>:w<CR>')
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>')

vim.keymap.set('n', '<leader>cr', ':let @+ = expand("%")<CR>', { noremap = true, silent = true, desc = '[C]opy [r]elative file name'})
vim.keymap.set('n', '<leader>j', ':execute "!pnpm -F " . split(expand("%"), "/")[1] . " test " . expand("%")<CR>', { noremap = true, silent = true, desc = '[J]est test'})

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

  -- Get the total number of windows
  local total_windows = vim.fn.winnr('$')
  local current_win_num = vim.fn.winnr()

  -- Determine if the current window is the rightmost one
  local is_rightmost = (current_win_num == total_windows)

  if is_rightmost then
    vim.cmd('vsplit')
  end

  if previous_buf ~= -1 then
    -- Move the previous buffer to the new window
    vim.api.nvim_win_set_buf(0, previous_buf)
  end

  -- Move to the right window
  vim.cmd('wincmd l')

  -- Set the current buffer in the original window
  vim.api.nvim_win_set_buf(0, current_buf)
end

-- Key mapping for moving buffer to horizontal split
vim.api.nvim_set_keymap('n', '<leader>mh', ':lua MoveToHSplit()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mv', ':lua MoveToVSplit()<CR>', { noremap = true, silent = true })

