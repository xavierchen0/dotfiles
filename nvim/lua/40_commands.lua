-- Command to update all plugins
vim.api.nvim_create_user_command("PackUpdate", function()
  vim.pack.update()
end, { desc = "Update all packages" })

-- Rename current file
vim.api.nvim_create_user_command("RenameFile", function()
  local oldname = vim.api.nvim_buf_get_name(0)
  if oldname == "" then
    vim.notify("Buffer is not a file", vim.log.levels.WARN)
    return
  end

  vim.ui.input({
    prompt = "New file name: ",
    default = oldname,
    completion = "file",
  }, function(newname)
    if not newname or newname == "" or newname == oldname then
      return
    end

    local success, err = os.rename(oldname, newname)

    if not success then
      vim.notify("Rename failed: " .. err, vim.log.levels.ERROR)
      return
    end

    vim.api.nvim_buf_set_name(0, newname)
    vim.cmd.edit(newname)

    vim.notify("File renamed to " .. newname, vim.log.levels.INFO)
  end)
end, { desc = "Rename current file" })
