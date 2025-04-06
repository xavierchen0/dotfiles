local harpoon = require("harpoon")

return {
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>hh",
      function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon Quick Menu",
    },
    {
      "<leader>hn",
      function()
        harpoon:list():next()
      end,
      desc = "Harpoon Next",
    },
    {
      "<leader>hp",
      function()
        harpoon:list():prev()
      end,
      desc = "Harpoon Previous",
    },
  },
}
