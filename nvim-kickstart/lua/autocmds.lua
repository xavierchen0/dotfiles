--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Automatically create parent directories on save
vim.api.nvim_create_autocmd({ 'BufWritePre', 'FileWritePre' }, {
  desc = 'Autocreate dir if it does not exist when writing',
  group = vim.api.nvim_create_augroup('auto_create_dir', { clear = true }),
  callback = function()
    local dir = vim.fn.expand '%:p:h'
    if vim.fn.isdirectory(dir) == 0 then
      local choice = vim.fn.confirm("Create directory '" .. dir .. "'?", '&Yes\n&No\n&Cancel', 1)
      if choice == 1 then
        vim.fn.mkdir(dir, 'p')
      end
    end
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  desc = 'Resize splits if window got resized',
  group = vim.api.nvim_create_augroup('resize_splits', { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd 'tabdo wincmd ='
    vim.cmd('tabnext ' .. current_tab)
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Go to last edit location when opening a new buffer',
  group = vim.api.nvim_create_augroup('last_loc', { clear = true }),
  callback = function(event)
    local exclude = { 'gitcommit' }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc_flag then
      return
    end
    vim.b[buf].last_loc_flag = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
