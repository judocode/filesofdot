-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Preserving Ctrl-a and Ctrl-e functionality to move to beginning and end of line
vim.keymap.set("i", "<C-e>", "<C-o>A", { noremap = true, silent = true })
vim.keymap.set("i", "<C-a>", "<C-o>I", { noremap = true, silent = true })

vim.keymap.set(
  "n",
  "<leader>C",
  ':let @+ = expand("%")<CR>',
  { noremap = true, silent = true, desc = "[C]opy relative file name" }
)

vim.api.nvim_set_keymap(
  "v",
  "<leader>ml",
  ":lua SurroundUUIDsWithQuotesAndParentheses()<CR>",
  { noremap = true, silent = true, desc = "[M]acro [L]ist" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>se",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { noremap = true, silent = true, desc = "Greps (w/ args)" }
)

-- Git
-- vim.keymap.set("n", "<leader>ga", ":G add -p<CR>", { noremap = true, silent = true, desc = "[G]it [A]dd" })

-- Function to surround UUIDs with single quotes, add commas, and wrap in parentheses
function SurroundUUIDsWithQuotesAndParentheses()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local start_line = start_pos[2] - 1
  local end_line = end_pos[2]

  local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)

  -- Drop trailing empty lines from the visual selection
  while #lines > 0 and lines[#lines]:match("^%s*$") do
    table.remove(lines)
  end

  for i, line in ipairs(lines) do
    lines[i] = line:gsub("^%s*", ""):gsub("%s*$", ""):gsub('^"?(.-)"?,?$', "'%1',")
  end

  -- Remove trailing comma from last entry
  lines[#lines] = lines[#lines]:gsub(",$", "")

  local result = "(" .. table.concat(lines, " ") .. ")"

  vim.api.nvim_buf_set_lines(0, start_line, end_line, false, { result })
  vim.fn.setreg("+", result)
end
