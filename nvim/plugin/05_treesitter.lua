vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } })

local hooks = function(ev)
  -- Use available |event-data|
  local name, kind = ev.data.spec.name, ev.data.kind

  -- Run build script after plugin's code has changed
  if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
    vim.cmd("TSUpdate")
  end
end

-- If hooks need to run on install, run this before `vim.pack.add()`
vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

require("nvim-treesitter").install({ "lua", "markdown", "markdown_inline", "python" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "markdown" },
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldmethod = "expr"
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
