-- CREDIT: https://github.com/neovim/neovim/discussions/33335
-- Convert a mark number (1-9) to its corresponding character (A-I)
local function mark2char(mark)
  if mark:match '[1-9]' then
    return string.char(mark + 64)
  end
  return mark
end

-- List bookmarks in the session
local function list_marks()
  local snacks = require 'snacks'
  return snacks.picker.marks {
    transform = function(item)
      if item.label and item.label:match '^[A-I]$' and item then
        item.label = '' .. string.byte(item.label) - string.byte 'A' + 1 .. ''
        return item
      end
      return false
    end,
  }
end

-- Add Marks ------------------------------------------------------------------
vim.keymap.set('n', 'm', function()
  local mark = vim.fn.getcharstr()
  local char = mark2char(mark)
  vim.cmd('mark ' .. char)
  if mark:match '[1-9]' then
    vim.notify('Added mark ' .. mark, vim.log.levels.INFO, { title = 'Marks' })
  else
    vim.fn.feedkeys('m' .. mark, 'n')
  end
end, { desc = 'Add mark' })

-- Go To Marks ----------------------------------------------------------------
vim.keymap.set('n', "'", function()
  local mark = vim.fn.getcharstr()
  local char = mark2char(mark)
  if not char:match '%u' then
    return vim.cmd("norm! '" .. char)
  end
  local mark_pos = vim.api.nvim_get_mark(char, {})
  if mark_pos[1] == 0 then
    return vim.notify('No Custom Global mark at ' .. mark, vim.log.levels.WARN, { title = 'Marks' })
  end

  vim.fn.feedkeys("'" .. mark2char(mark), 'n')
end, { desc = 'Go to Custom Global mark' })

-- List Marks -----------------------------------------------------------------
vim.keymap.set('n', '<Leader>mm', function()
  list_marks()
end, { desc = 'List Custom Global marks' })

-- Delete Marks ---------------------------------------------------------------
vim.keymap.set('n', '<Leader>md', function()
  local mark = vim.fn.getcharstr()
  vim.api.nvim_del_mark(mark2char(mark))
  vim.notify('Deleted Custom Global mark ' .. mark, vim.log.levels.INFO, { title = 'Marks' })
end, { desc = 'Delete Custom Global mark' })

vim.keymap.set('n', '<Leader>mD', function()
  vim.cmd 'delmarks A-I'
  vim.notify('Deleted all Custom Global marks', vim.log.levels.INFO, { title = 'Marks' })
end, { desc = 'Delete all Custom Global marks' })
