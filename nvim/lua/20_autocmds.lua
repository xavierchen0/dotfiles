-- Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
-- Do on `FileType` to always override these changes from filetype plugins.
local f = function()
  vim.cmd("setlocal formatoptions-=c formatoptions-=o")
end
_G.Config.new_autocmd("FileType", nil, f, "Proper 'formatoptions'")

-- Highlight when yanking (copying) text
--  See `:help vim.hl.on_yank()`
f = function()
  vim.hl.on_yank()
end
_G.Config.new_autocmd("TextYankPost", nil, f, "Highlight when yanking (copying) text")

-- To also store yanks (not only deletions) in registers 1-9, try this: >lua
-- Yank-ring: store yanked text in registers 1-9.
f = function()
  if vim.v.event.operator == "y" then
    for i = 9, 1, -1 do -- Shift all numbered registers.
      vim.fn.setreg(tostring(i), vim.fn.getreg(tostring(i - 1)))
    end
  end
end
_G.Config.new_autocmd("TextYankPost", nil, f, "Yank-ring")

-- Automatically create parent directories on save
f = function()
  local dir = vim.fn.expand("%:p:h")
  if vim.fn.isdirectory(dir) == 0 then
    local choice = vim.fn.confirm("Create directory '" .. dir .. "'?", "&Yes\n&No\n&Cancel", 1)
    if choice == 1 then
      vim.fn.mkdir(dir, "p")
    end
  end
end
_G.Config.new_autocmd({ "BufWritePre", "FileWritePre" }, nil, f, "Autocreate dir if it does not exist when writing")

-- resize splits if window got resized
f = function()
  local current_tab = vim.fn.tabpagenr()
  vim.cmd("tabdo wincmd =")
  vim.cmd("tabnext " .. current_tab)
end
_G.Config.new_autocmd("VimResized", nil, f, "Resize splits if window got resized")

-- go to last loc when opening a buffer
f = function(event)
  local exclude = { "gitcommit" }
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
end
_G.Config.new_autocmd("BufReadPost", nil, f, "Go to last edit location when opening a new buffer")
