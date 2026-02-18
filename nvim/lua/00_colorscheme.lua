vim.pack.add({
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
})

require("rose-pine").setup()

-- Unlink DiagnosticUnnecessary so it does not gray out unused variables/functions
-- Apply autocommand whenever we load/switch colorscheme
local f = function()
  vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "NONE" })
end
_G.Config.new_autocmd("ColorScheme", nil, f, "Remove Unused highlight when colorscheme loads/switch")

vim.cmd.colorscheme("rose-pine-moon")
