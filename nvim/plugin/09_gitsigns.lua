vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

local gitsigns = require("gitsigns")
vim.keymap.set("n", "<leader>gh", function()
  gitsigns.setloclist()
end, { desc = "Populate location list with buffer hunks" })
