-- stylua: ignore start
-- General ====================================================================
vim.g.mapleader = " "                          -- Use `<Space>` as <Leader> key
vim.g.maplocalleader = " "                     -- Use `<Space>` as <Leader> key

vim.o.mouse = "a"                              -- Enable mouse
vim.o.mousescroll = "ver:25,hor:6"             -- Customize mouse scroll
vim.o.switchbuf = "usetab"                     -- Use already opened buffers when switching
vim.o.undofile = true                          -- Enable persistent undo

vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup performance)

vim.o.confirm = true                           -- Provide confirm message

-- Enable all filetype plugins and syntax (if not enabled, for better startup)
vim.cmd("filetype plugin indent on")
if vim.fn.exists("syntax_on") ~= 1 then
  vim.cmd("syntax enable")
end

-- Sync with computer's clipboard
vim.o.clipboard = "unnamedplus"

-- UI =========================================================================
vim.o.breakindent = true                  -- Indent wrapped lines to match line start
vim.o.breakindentopt = "list:-1"          -- Add padding for lists (if 'wrap' is set)
vim.o.cursorline = true                   -- Enable current line highlighting
vim.o.linebreak = true                    -- Wrap lines at 'breakat' (if 'wrap' is set)
vim.o.list = true                         -- Show helpful text indicators
vim.o.relativenumber = true
vim.o.pumheight = 10                      -- Make popup menu smaller
vim.o.signcolumn = "yes"                  -- Always show signcolumn (less flicker)
vim.o.splitbelow = true                   -- Horizontal splits will be below
vim.o.splitkeep = "screen"                -- Reduce scroll during window split
vim.o.splitright = true                   -- Vertical splits will be to the right
vim.o.winborder = "rounded"               -- Use border in floating windows
vim.o.wrap = false                        -- Don't visually wrap lines (toggle with \w)
vim.o.scrolloff = 10                      -- Minimal number of screen lines to keep above and below the cursor.

vim.o.cursorlineopt = "screenline,number" -- Show cursor line per screen line

-- Folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
vim.o.foldlevel = 10        -- Fold nothing by default; set to 0 or 1 to fold
-- vim.o.foldcolumn = "auto"   -- Indicate fold
vim.o.foldmethod = "indent" -- Fold based on indent level
vim.o.foldnestmax = 10      -- Limit number of fold levels
vim.o.foldtext = ""         -- Show text under fold with its highlighting

-- Editing ====================================================================
vim.o.autoindent = true        -- Use auto indent
vim.o.expandtab = true         -- Convert tabs to spaces
vim.o.formatoptions = "rqnl1j" -- Improve comment editing
vim.o.ignorecase = true        -- Ignore case during search
vim.o.incsearch = true         -- Show search matches while typing
vim.o.inccommand = "split"     -- Preview substitutions live, as you type!
vim.o.infercase = true         -- Infer case in built-in completion
vim.o.shiftwidth = 2           -- Use this number of spaces for indentation
vim.o.smartcase = true         -- Respect case if search pattern has upper case
vim.o.smartindent = true       -- Make indenting smart
vim.o.spelloptions = "camel"   -- Treat camelCase word parts as separate words
vim.o.tabstop = 2              -- Show tab as this number of spaces
vim.o.virtualedit = "block"    -- Allow going past end of line in blockwise mode

-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Built-in completion
vim.o.complete = ".,w,b,kspell"                    -- Use less sources
vim.o.completeopt = "menuone,noselect,fuzzy,popup" -- Use custom behavior

-- :h vim._extui
require("vim._extui").enable({})
