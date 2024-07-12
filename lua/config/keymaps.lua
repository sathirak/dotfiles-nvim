-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- open and close terminal
local map = vim.keymap.set
map("t", "<a-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end

map("n", "<a-/>", lazyterm, { desc = "Show Terminal" })

-- select all
map("n", "<C-a>", "gg<S-v>G")
map("n", "<C-a>", "gg<S-v>G")

-- select line
map("n", "<C-l>", "V", {})
map("v", "<C-l>", "V", {})

-- actions without affecting registers

-- Delete character under cursor without affecting default register
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })

-- Paste content of yank register after cursor
vim.api.nvim_set_keymap("n", "<Leader>p", '"0p', { noremap = true, silent = true })

-- Paste content of yank register before cursor
vim.api.nvim_set_keymap("n", "<Leader>P", '"0P', { noremap = true, silent = true })

-- Paste content of yank register after selection
vim.api.nvim_set_keymap("v", "<Leader>p", '"0p', { noremap = true, silent = true })

-- Change text at cursor without affecting default register
vim.api.nvim_set_keymap("n", "<Leader>c", '"_c', { noremap = true, silent = true })

-- Change text from cursor to end of line without affecting default register
vim.api.nvim_set_keymap("n", "<Leader>C", '"_C', { noremap = true, silent = true })

-- Change selected text without affecting default register
vim.api.nvim_set_keymap("v", "<Leader>c", '"_c', { noremap = true, silent = true })

-- Change selected text from cursor to end of line without affecting default register
vim.api.nvim_set_keymap("v", "<Leader>C", '"_C', { noremap = true, silent = true })

-- Delete text at cursor without affecting default register
vim.api.nvim_set_keymap("n", "<Leader>d", '"_d', { noremap = true, silent = true })

-- Delete text from cursor to end of line without affecting default register
vim.api.nvim_set_keymap("n", "<Leader>D", '"_D', { noremap = true, silent = true })

-- Delete selected text without affecting default register
vim.api.nvim_set_keymap("v", "<Leader>d", '"_d', { noremap = true, silent = true })

-- Delete selected text from cursor to end of line without affecting default register
vim.api.nvim_set_keymap("v", "<Leader>D", '"_D', { noremap = true, silent = true })

-- tab to switch between normal and insert model
map("n", "<a-m>", "i", { noremap = true, silent = true })
map("i", "<a-m>", "<Esc>", { noremap = true, silent = true })
