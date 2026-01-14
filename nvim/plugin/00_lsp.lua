vim.pack.add({
  -- Provides default lsp configs
  { src = 'https://github.com/neovim/nvim-lspconfig'}
})

vim.lsp.enable({'lua_ls'})
