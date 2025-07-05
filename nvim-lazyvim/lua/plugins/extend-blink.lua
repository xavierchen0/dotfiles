return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<C-j>"] = { "select_next", "fallback_to_mappings" },
      ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
    },
  },
}
