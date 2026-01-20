vim.pack.add({ "https://github.com/nvim-mini/mini.snippets" })

local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
  snippets = {
    -- Load custom file with global snippets first
    gen_loader.from_file("~/.config/nvim/snippets/global.lua"),

    -- Load snippets based on current language by reading files from
    -- "snippets/" subdirectories from 'runtimepath' directories.
    gen_loader.from_lang(),
  },
})
