local function swap_keys(original_key, mapped_key)
  vim.keymap.set('n', original_key, mapped_key, { noremap = true, silent = true })
  vim.keymap.set('n', mapped_key, original_key, { noremap = true, silent = true })
  vim.keymap.set('v', original_key, mapped_key, { noremap = true, silent = true })
  vim.keymap.set('v', mapped_key, original_key, { noremap = true, silent = true })
end

local function swap_up_down(original_key, mapped_key)
  swap_keys(original_key, mapped_key)

  -- Remap for dealing with word wrap
  vim.keymap.set('n', mapped_key, "v:count == 0 ? 'g" .. original_key .. "' : '" .. original_key .. "'", { expr = true, silent = true })
end

swap_keys('h', 'm')
swap_up_down('j', 'n')
swap_up_down('k', 'e')
swap_keys('l', 'i')

vim.keymap.set('v', 'N', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'E', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'j', "nzzzv")
vim.keymap.set('n', 'J', "Nzzzv")

vim.api.nvim_set_keymap('n', '<C-w>m', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>n', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>e', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>i', '<C-w>l', { noremap = true, silent = true })
