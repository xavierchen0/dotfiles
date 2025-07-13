return {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  opts = { window = { winblend = 0 } },
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    { '<leader>uu', "<cmd>lua require('undotree').toggle()<cr>", desc = 'Toggle Undo Tree' },
  },
}
