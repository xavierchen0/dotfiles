vim.pack.add({
  { src = "https://github.com/MeanderingProgrammer/treesitter-modules.nvim" }
})

require('treesitter-modules').setup({
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-n>',
      node_incremental = '<C-n>',
      scope_incremental = false,
      node_decremental = '<C-p>',
    }
  }
})
