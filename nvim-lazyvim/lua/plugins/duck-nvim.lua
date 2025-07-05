return {
  "tamton-aquib/duck.nvim",
  -- e.g. change custom character: nnoremap <leader>dd :lua require("duck").hatch("ඞ")<CR>
  -- e.g. change speed eg 1 vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦆", 10) end, {}) -- A pretty fast duck
  -- e.g. change speed eg 2 vim.keymap.set('n', '<leader>dc', function() require("duck").hatch("🐈", 0.75) end, {}) -- Quite a mellow cat

  config = function()
    vim.api.nvim_create_user_command("DuckHatch", function()
      require("duck").hatch("🦆", 100)
    end, {})
    vim.api.nvim_create_user_command("DuckCook", function()
      require("duck").cook()
    end, {})
    vim.api.nvim_create_user_command("DuckCookAll", function()
      require("duck").cook_all()
    end, {})
  end,
}
