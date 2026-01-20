vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-lint", name = "nvim-lint" },
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()
  end,
})

require("lint").linters_by_ft = {
  markdown = { "markdownlint-cli2" },
  python = { "ruff" },
}
