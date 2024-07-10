-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("t", "<a-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end

map("n", "<a-/>", lazyterm, { desc = "Show Terminal" })
