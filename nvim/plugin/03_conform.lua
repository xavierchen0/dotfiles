vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim", name = "conform" },
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    markdown = { "prettier" },
    python = {
      -- To fix auto-fixable lint errors.
      -- "ruff_fix",
      -- To run the Ruff formatter.
      "ruff_format",
      -- To organize the imports.
      "ruff_organize_imports",
    },
    tex = { "latexindent" },
    sql = { "sqlfluff" },
  },
  formatters = {
    latexindent = {
      append_args = { "-l" },
    },
    prettier = {
      append_args = { "--prose-wrap=always" },
    },
    sqlfluff = {
      command = "sqlfluff",
      args = {
        "format",
        "-",
      },
      stdin = true,
      exit_codes = { 0, 1 },
    },
  },
  format_on_save = function(bufnr)
    -- 1. Check for the user-triggered buffer toggle
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    -- 2. Disable for a specific file pattern or name
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match("qmk_firmware/.-/keymap%.c$") then
      return
    end

    if bufname:match("%.config/my_lily58/keymap%.c$") then
      return
    end

    return {
      timeout_ms = 5000,
      lsp_format = "fallback",
    }
  end,
  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_format = "fallback",
  -- },
})
