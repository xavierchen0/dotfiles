vim.pack.add({
  -- Provides default lsp configs
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

local f = function()
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
end
_G.Config.new_autocmd("LspAttach", nil, f, "Code Actions")

vim.lsp.enable({ "lua_ls", "marksman", "ty", "texlab" })
