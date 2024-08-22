local function swap_keys(key1, key2)
  vim.keymap.set('n', key1, key2, { noremap = true, silent = true })
  vim.keymap.set('n', key2, key1, { noremap = true, silent = true })
  vim.keymap.set('v', key1, key2, { noremap = true, silent = true })
  vim.keymap.set('v', key2, key1, { noremap = true, silent = true })
end

swap_keys('m', 'h')
swap_keys('n', 'j')
swap_keys('e', 'k')
swap_keys('i', 'l')

vim.keymap.set('v', 'N', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'E', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'j', "nzzzv")
vim.keymap.set('n', 'J', "Nzzzv")

vim.api.nvim_set_keymap('n', '<C-w>m', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>n', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>e', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>i', '<C-w>l', { noremap = true, silent = true })
