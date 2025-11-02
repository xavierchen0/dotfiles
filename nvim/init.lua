require 'options'
require 'keymaps'
require 'autocmds'
require 'args_harpoon'

require 'lazy-bootstrap'

require('lazy').setup {
  spec = { import = 'plugins' },
  change_detection = { notify = false },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
