vim.defer_fn(function()
  vim.pack.add({ "https://github.com/mistricky/codesnap.nvim" })

  require("codesnap").setup({
    snapshot_config = {
      window = {
        margin = {
          x = 10,
          y = 10,
        },
      },
    },
  })
end, 50)
