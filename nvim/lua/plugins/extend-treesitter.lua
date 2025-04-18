return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "jinja", "htmldjango" },
    highlight = {
      additional_vim_regex_highlighting = { "jinja", "html", "htmldjango" },
    },
  },
}
