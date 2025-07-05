return {
  "L3MON4D3/LuaSnip",
  init = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })
    vim.api.nvim_set_keymap("i", "<C-c>", "<Plug>luasnip-next-choice", {})
    vim.api.nvim_set_keymap("s", "<C-c>", "<Plug>luasnip-next-choice", {})
  end,
}
