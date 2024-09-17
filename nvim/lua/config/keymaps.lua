-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Add new line above/below the current line and stay in Normal mode
vim.keymap.set("n", "<Leader>o", "o<Esc>", { desc = "Add new line below and stay in Normal mode" })
vim.keymap.set("n", "<Leader>O", "O<Esc>", { desc = "Add new line above and stay in Normal mode" })
