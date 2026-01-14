-- Show help in vertical split
vim.cmd.cabbrev("h", "vert h")

-- Remove search highlight on <ESC> press
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>")

-- Center every scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page and center" })

-- Add diagnostic to location list
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist)

-- Better movement with j/k even with wrapped lines
vim.keymap.set("n", "j", "gj", { desc = "Move down by visual line (not logical line)" })
vim.keymap.set("n", "k", "gk", { desc = "Move up by visual line (not logical line)" })
