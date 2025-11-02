-- Core editing enhancements and text manipulation tools

return {
  -- Detect tabstop and shiftwidth automatically
  { 'NMAC427/guess-indent.nvim', opts = {} },

  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>f', group = '[f]ind' },
        { 'gr', group = 'LSP/Diagnostics/Formatting' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>u', group = 'UI' },
        { '<leader>d', group = 'Debug' },
        { '<leader>dw', group = 'Debug UI Widgets' },
        { '<leader>m', group = 'Args Harpoon' },
        { '<leader>g', group = 'Lazygit' },
        { '<leader>j', group = 'Jupynium' },
      },
    },
  },

  -- Highlight todos and keywords
  {
    'folke/todo-comments.nvim',
    event = { 'BufRead', 'BufNewFile' },
    opts = {},
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        '<leader>ft',
        function()
          require('snacks').picker.todo_comments { keywords = { 'TODO' } }
        end,
        desc = 'Todo',
      },
      {
        '<leader>fT',
        function()
          require('snacks').picker.todo_comments { keywords = { 'TODO', 'FIX', 'FIXME' } }
        end,
        desc = 'Todo/Fix/Fixme',
      },
    },
  },

  -- Autoclose and autorename html tags
  { 'windwp/nvim-ts-autotag', opts = {} },

  -- Autopairs
  { 'windwp/nvim-autopairs', opts = {} },
}
