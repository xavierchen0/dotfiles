vim.pack.add({
  { src = "https://github.com/xavierchen0/hooks.nvim" },
})

local h = require("hooks")
-- stylua: ignore start
local valid_keys = {
  "0", "1", "2", "3", "4", "5",
}
-- stylua: ignore end
local prefix = "<leader>m"

for _, key in ipairs(valid_keys) do
  vim.keymap.set("n", prefix .. key, function()
    h.jump(key)
  end, { desc = "Hooks: Jump to [" .. key .. "]" })

  vim.keymap.set("n", prefix .. "a" .. key, function()
    h.add(key)
  end, { desc = "Hooks: Add current file to [" .. key .. "]" })
end

vim.keymap.set("n", prefix .. "m", function()
  h.menu()
end, { desc = "Hooks: Open editable menu" })
