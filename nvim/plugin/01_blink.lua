vim.pack.add({
  { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
})

require("blink.cmp").setup({
  completion = {
    keyword = {
      range = "full",
    },
    trigger = {
      show_on_backspace = true,
    },
    menu = {
      draw = {
        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
      },
    },
  },
  signature = {
    enabled = true,
    trigger = { show_on_insert = false, show_on_trigger_character = false, show_on_insert_on_trigger_character = false },
  },
  snippets = { preset = "mini_snippets" },
})

vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpActiveParameter", { link = "IncSearch" })
