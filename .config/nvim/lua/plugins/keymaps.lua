-- Navigation
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('x', '<leader>p', '"_dP')
--vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>ww', '<C-w>w')
vim.keymap.set('n', '<C-s>', '<Esc>:w<CR>')
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>')

vim.keymap.set('n', '<leader>cr', ':let @+ = expand("%")<CR>',
  { noremap = true, silent = true, desc = '[C]opy [r]elative file name' })
vim.keymap.set('n', '<leader>j', ':execute "!pnpm -F " . split(expand("%"), "/")[1] . " test " . expand("%")<CR>',
  { noremap = true, silent = true, desc = '[J]est test' })

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

-- Function to move current buffer to the left
function MoveToLeft()
  local current_buf = vim.api.nvim_get_current_buf()

  -- Get the previous buffer number
  local previous_buf = vim.fn.bufnr('#')

  -- Get the total number of windows
  local total_windows = vim.fn.winnr('$')
  local current_win_num = vim.fn.winnr()

  -- Cannot move left if already the leftmost
  if curren_win_num == 0 then
    return
  end

  if previous_buf ~= -1 then
    -- Move the previous buffer to the new window
    vim.api.nvim_win_set_buf(0, previous_buf)
  end

  -- Move to the right window
  vim.cmd('wincmd h')

  -- Set the current buffer in the original window
  vim.api.nvim_win_set_buf(0, current_buf)
end

-- Function to surround UUIDs with single quotes, add commas, and wrap in parentheses
function SurroundUUIDsWithQuotesAndParentheses()
  -- Get the start and end positions of the visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local start_line = start_pos[2] - 1 -- Get the line number (zero-indexed)
  local end_line = end_pos[2] - 1     -- Get the line number (zero-indexed)

  -- Get the lines from the buffer
  local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)

  -- Process each line: surround with single quotes and add a comma
  for i, line in ipairs(lines) do
    lines[i] = line:gsub('^%s*"?(.+)"?,?$', "'%1',")
  end

  -- Remove the comma from the last line
  lines[#lines] = lines[#lines]:gsub(",$", "")
  -- Combine all the lines into one single line
  local combined_line = table.concat(lines, " ")

  -- Replace the selected lines with the modified single line surrounded by parentheses
  vim.api.nvim_buf_set_lines(0, start_line, end_line, false, { "(" .. combined_line .. ")" })
end

vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, desc = '[Y]ank to clipboard' })
vim.api.nvim_set_keymap('v', '<leader>tl', ':lua SurroundUUIDsWithQuotesAndParentheses()<CR>',
  { noremap = true, silent = true, desc = '[T]ext [L]ist' })
-- Key mapping for moving buffer to horizontal split
vim.api.nvim_set_keymap('n', '<leader>mh', ':lua MoveToHSplit()<CR>',
  { noremap = true, silent = true, desc = '[M]ove [H]orizontal' })
vim.api.nvim_set_keymap('n', '<leader>mv', ':lua MoveToVSplit()<CR>',
  { noremap = true, silent = true, desc = '[M]ove [V]ertical' })

vim.api.nvim_set_keymap('n', '<leader>ml', ':lua MoveToLeft()<CR>',
  { noremap = true, silent = true, desc = '[M]ove [L]eft' })
vim.api.nvim_set_keymap('n', '<leader>mr', ':lua MoveToVSplit()<CR>',
  { noremap = true, silent = true, desc = '[M]ove [R]ight' })
