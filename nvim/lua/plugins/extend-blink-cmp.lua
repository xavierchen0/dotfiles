return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },

    -- signature = { enabled = true },

    completion = { ghost_text = { enabled = false } },
  },
}
