vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim", name = "conform" },
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "styua" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})
