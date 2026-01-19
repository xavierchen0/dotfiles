vim.pack.add({
  { src = "https://github.com/xavierchen0/ezpoon" },
})

local ez = require("ezpoon")
-- stylua: ignore start
local valid_keys = {
  "0", "1", "2", "3", "4", "5",
}
-- stylua: ignore end
local prefix = "<leader>m"

for _, key in ipairs(valid_keys) do
  vim.keymap.set("n", prefix .. key, function()
    ez.jump(key)
  end, { desc = "EZpoon: Jump to [" .. key .. "]" })

  vim.keymap.set("n", prefix .. "a" .. key, function()
    ez.add(key)
  end, { desc = "EZpoon: Add current file to [" .. key .. "]" })
end

vim.keymap.set("n", prefix .. "m", function()
  ez.menu()
end, { desc = "EZpoon: Open editable menu" })
