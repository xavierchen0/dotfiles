-- Show help in vertical split
vim.cmd.cabbrev("h", "vert h")

-- Remove search highlight on <ESC> press
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>")
