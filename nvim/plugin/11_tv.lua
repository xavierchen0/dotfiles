vim.pack.add({
  { src = 'https://github.com/alexpasmantier/tv.nvim' }
})

local h = require('tv').handlers

require('tv').setup({
  channels = {
    files = {
      keybinding = "<leader>ff",
      handlers = {
        ["<CR>"] = h.open_as_files,
        ["<C-q>"] = h.sent_to_quickfix,
        ["<C-s>"] = h.open_in_split,
        ["<C-v>"] = h.open_in_vsplit,
        ["<C-y>"] = h.copy_to_clipboard
      }
    },
    text = {
      keybinding = "<leader>fg",
      handlers = {
        ["<CR>"] = h.open_at_line,
        ["<C-q>"] = h.sent_to_quickfix,
        ["<C-s>"] = h.open_in_split,
        ["<C-v>"] = h.open_in_vsplit,
        ["<C-y>"] = h.copy_to_clipboard
      }
    },
    env = {
      keybinding = "<leader>fe",
      handlers = {
        ["<CR>"] = h.insert_at_cursor,
        ["<C-l>"] = h.insert_on_new_line,
        ["<C-y>"] = h.copy_to_clipboard,
      },
    },
  }
})
