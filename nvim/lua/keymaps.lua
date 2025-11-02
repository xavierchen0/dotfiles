-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', 'grq', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Better movement with j/k even with wrapped lines
vim.keymap.set('n', 'j', 'gj', { desc = 'Move down by visual line (not logical line)' })
vim.keymap.set('n', 'k', 'gk', { desc = 'Move up by visual line (not logical line)' })

-- Center every scroll
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down half page and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up half page and center' })

-- Gitsigns keymaps
vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>', { desc = '[r]eset git hunk' })
vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk_inline<cr>', { desc = '[p]review hunks inline' })
vim.keymap.set('n', '<leader>hb', '<cmd>Gitsigns blame_line<cr>', { desc = 'Show [b]lame for the current line' })
vim.keymap.set('n', '<leader>hB', '<cmd>Gitsigns blame<cr>', { desc = 'Show [B]lame of current buffer' })
vim.keymap.set('n', '<leader>hq', '<cmd>Gitsigns setqflist target=attached<cr>', { desc = 'Set the [q]uickfix list with changes' })
