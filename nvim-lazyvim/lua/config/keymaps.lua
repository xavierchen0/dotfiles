-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Leader>o", "o<Esc>", { desc = "Add new line below and stay in Normal mode" })
vim.keymap.set("n", "<Leader>O", "O<Esc>", { desc = "Add new line above and stay in Normal mode" })

vim.keymap.set("n", "<leader>uk", function()
  vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })

  vim.api.nvim_create_autocmd("CursorMoved", {
    group = vim.api.nvim_create_augroup("line-diagnostics", { clear = true }),
    callback = function()
      vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
      return true
    end,
  })
end)
