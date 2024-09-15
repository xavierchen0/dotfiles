return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local compare = cmp.config.compare

      local custom_opts = {
        sources = {
          { name = "jupynium", priority = 1000 },
          { name = "nvim_lsp", priority = 100 },
        },
        sorting = {
          priority_weight = 1.0,
          comparators = {
            compare.score,
            compare.recently_used,
            compare.locality,
          },
        },
      }

      opts = vim.tbl_deep_extend("force", opts, custom_opts)
    end,
  },
}
