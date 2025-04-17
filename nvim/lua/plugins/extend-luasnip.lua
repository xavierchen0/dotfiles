return {
  "L3MON4D3/LuaSnip",
  init = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })
  end,
}
