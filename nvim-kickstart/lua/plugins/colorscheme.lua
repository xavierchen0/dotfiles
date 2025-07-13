return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd.colorscheme 'rose-pine-moon'
    end,
  },
  'folke/tokyonight.nvim',
  { 'catppuccin/nvim', name = 'catppuccin' },
  {
    'ellisonleao/gruvbox.nvim',
    config = function()
      vim.o.background = 'dark'
    end,
  },
}
