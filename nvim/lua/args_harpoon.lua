-- simple global-ish storage
_G.GLOBAL_SLOTS = _G.GLOBAL_SLOTS or { nil, nil, nil, nil }
_G.PROJ_SLOTS = _G.PROJ_SLOTS or { nil, nil, nil, nil }

----------------------------------------------------------
-- helpers: get git root, project key, persistence path
----------------------------------------------------------

local function get_git_root()
  local ok, out = pcall(vim.fn.systemlist, 'git rev-parse --show-toplevel 2>/dev/null')
  if not ok or not out or #out == 0 then
    return nil
  end
  local root = out[1]
  if root == '' then
    return nil
  end
  return vim.fn.fnamemodify(root, ':p')
end

-- returns (key, root)
-- key is a hash/identifier for per-project storage;
-- if no git root, returns nil, nil
local function project_key()
  local root = get_git_root()
  if not root then
    return nil, nil
  end

  local hashed = vim.fn.sha256(root)
  return hashed, root
end

-- given current context, where do we store?
-- if in git -> per-project file
-- else -> a single global file
local function store_path_for_current_context()
  local key, _ = project_key()
  local base_dir = vim.fn.stdpath 'data' .. '/project_argslots'
  vim.fn.mkdir(base_dir, 'p')

  if key then
    return base_dir .. '/' .. key .. '.json', false -- project-scoped
  else
    return base_dir .. '/global.json', true -- global fallback
  end
end

----------------------------------------------------------
-- slot table getters/setters based on context
----------------------------------------------------------

-- Return the active slots table (PROJ_SLOTS or GLOBAL_SLOTS)
local function get_slots_table()
  local root = get_git_root()
  if root then
    return _G.PROJ_SLOTS
  else
    return _G.GLOBAL_SLOTS
  end
end

-- Replace the active table in memory (after loading from disk)
local function set_slots_table(new_slots)
  local root = get_git_root()
  if root then
    _G.PROJ_SLOTS = new_slots
  else
    _G.GLOBAL_SLOTS = new_slots
  end
end

----------------------------------------------------------
-- IO: load/save slots for current context
----------------------------------------------------------

local function load_slots_for_context()
  local path = store_path_for_current_context()
  local slots = { nil, nil, nil, nil }

  if vim.fn.filereadable(path) == 0 then
    -- nothing persisted yet for this context, keep defaults
    set_slots_table(slots)
    return
  end

  local lines = vim.fn.readfile(path)
  if type(lines) ~= 'table' then
    set_slots_table(slots)
    return
  end

  for i = 1, 4 do
    local v = lines[i]
    if v and v ~= '' then
      slots[i] = v
    end
  end

  set_slots_table(slots)
end

local function save_slots_for_context()
  local path = store_path_for_current_context()
  local slots = get_slots_table()

  local lines = {}
  for i = 1, 4 do
    lines[i] = slots[i] or ''
  end
  vim.fn.writefile(lines, path)
end

----------------------------------------------------------
-- helpers: current buffer file, abs path
----------------------------------------------------------

local function current_file()
  local f = vim.api.nvim_buf_get_name(0)
  if f == '' then
    vim.notify('No file for this buffer', vim.log.levels.WARN)
    return nil
  end
  return vim.fn.fnamemodify(f, ':p')
end

----------------------------------------------------------
-- helpers: rebuild :args to reflect active slots
-- keeps :args / :next / :prev in sync with slots
----------------------------------------------------------

local function rebuild_arglist()
  local slots = get_slots_table()
  local files = {}
  for i = 1, 4 do
    if slots[i] then
      table.insert(files, vim.fn.fnameescape(slots[i]))
    end
  end

  -- capture current buffer so we can restore it after :args
  local cur_buf = vim.api.nvim_get_current_buf()

  if #files > 0 then
    vim.cmd('args ' .. table.concat(files, ' '))
    vim.cmd.argdedup()
  end

  -- go back to whatever buffer we were editing before
  if vim.api.nvim_buf_is_valid(cur_buf) then
    vim.api.nvim_set_current_buf(cur_buf)
  end
end

----------------------------------------------------------
-- main ops: save slot / open slot
----------------------------------------------------------

local function save_slot(n)
  -- sync from disk first to avoid stomping newer data
  load_slots_for_context()

  local f = current_file()
  if not f then
    return
  end

  local slots = get_slots_table()
  slots[n] = f

  save_slots_for_context()
  rebuild_arglist()

  vim.notify('Saved to slot ' .. n .. ':\n' .. f)
end

local function open_slot(n)
  -- load to make sure we have the right context's slots
  load_slots_for_context()

  local slots = get_slots_table()
  local f = slots[n]
  if not f then
    vim.notify('Slot ' .. n .. ' is empty in this context', vim.log.levels.WARN)
    return
  end

  -- open file
  vim.cmd.edit(vim.fn.fnameescape(f))

  -- sync :argument index so :next / :prev follow
  local argv = vim.fn.argv()
  for i, path in ipairs(argv) do
    if vim.fn.fnamemodify(path, ':p') == vim.fn.fnamemodify(f, ':p') then
      vim.cmd(i .. 'argu')
      break
    end
  end
end

----------------------------------------------------------
-- Keymaps
-- save/open current buffer to slot 1..4
-- open arglist
----------------------------------------------------------

vim.keymap.set('n', '<leader>ma1', function()
  save_slot(1)
end, { desc = 'Add Current File to Arg List Slot [1]' })
vim.keymap.set('n', '<leader>ma2', function()
  save_slot(2)
end, { desc = 'Add Current File to Arg List Slot [2]' })
vim.keymap.set('n', '<leader>ma3', function()
  save_slot(3)
end, { desc = 'Add Current File to Arg List Slot [3]' })
vim.keymap.set('n', '<leader>ma4', function()
  save_slot(4)
end, { desc = 'Add Current File to Arg List Slot [4]' })

-- keymaps: open slot 1..4
vim.keymap.set('n', '<leader>m1', function()
  open_slot(1)
end, { desc = 'Open Arg List Slot [1]' })
vim.keymap.set('n', '<leader>m2', function()
  open_slot(2)
end, { desc = 'Open Arg List Slot [2]' })
vim.keymap.set('n', '<leader>m3', function()
  open_slot(3)
end, { desc = 'Open Arg List Slot [3]' })
vim.keymap.set('n', '<leader>m4', function()
  open_slot(4)
end, { desc = 'Open Arg List Slot [4]' })

-- keymaps: show arglist
vim.keymap.set('n', '<leader>mm', function()
  vim.cmd.args()
end, { desc = 'Open Arg List' })

-----------------------------------------------------------------------
-- AUTOCMDS for persistence
-----------------------------------------------------------------------

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- just load them into memory, do NOT touch buffers
    load_slots_for_context()
  end,
})

vim.api.nvim_create_autocmd('DirChanged', {
  callback = function()
    load_slots_for_context()
    rebuild_arglist() -- include only if you WANT arglist to follow project after :cd
  end,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    save_slots_for_context()
  end,
})

-----------------------------------------------------------------------
-- Optional: Nicer arglist view
-----------------------------------------------------------------------

-- keymap: show slots in a nice float (like before)
-- vim.keymap.set('n', '<leader>mm', function()
--   local lines = {}
--   for i = 1, 4 do
--     local mark = _G.ARG_SLOTS[i] or '[empty]'
--     table.insert(lines, string.format('[%d] %s', i, mark))
--   end
--
--   local width = math.floor(vim.o.columns * 0.6)
--   local height = math.min(#lines + 2, 10)
--   local row = math.floor((vim.o.lines - height) / 2)
--   local col = math.floor((vim.o.columns - width) / 2)
--
--   local buf = vim.api.nvim_create_buf(false, true)
--   vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
--   vim.api.nvim_buf_set_option(buf, 'modifiable', false)
--   vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
--
--   local win = vim.api.nvim_open_win(buf, true, {
--     relative = 'editor',
--     width = width,
--     height = height,
--     row = row,
--     col = col,
--     border = 'rounded',
--     title = ' Slots ',
--     style = 'minimal',
--   })
--
--   -- q to close
--   vim.keymap.set('n', 'q', function()
--     if vim.api.nvim_win_is_valid(win) then
--       vim.api.nvim_win_close(win, true)
--     end
--   end, { buffer = buf, nowait = true, silent = true })
--
--   -- <CR> to jump to the highlighted slot
--   vim.keymap.set('n', '<CR>', function()
--     local line_nr = vim.api.nvim_win_get_cursor(win)[1]
--     if line_nr >= 1 and line_nr <= 4 then
--       local f = _G.ARG_SLOTS[line_nr]
--       if f then
--         if vim.api.nvim_win_is_valid(win) then
--           vim.api.nvim_win_close(win, true)
--         end
--         open_slot(line_nr)
--       else
--         vim.notify('Slot ' .. line_nr .. ' is empty', vim.log.levels.WARN)
--       end
--     end
--   end, { buffer = buf, nowait = true, silent = true })
-- end)
