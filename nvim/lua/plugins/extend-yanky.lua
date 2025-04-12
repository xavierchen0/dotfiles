return {
  "gbprod/yanky.nvim",
  init = function(_)
    vim.api.nvim_set_hl(0, "YankyYanked", { link = "IncSearch" })
  end,
}
