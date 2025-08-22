return {
  'kiyoon/jupynium.nvim',
  opts = {
    python_host = vim.fn.getcwd() .. '/.venv/bin/python',
    jupyter_command = { 'uv', 'run', 'jupyter' },
  },
  keys = {
    { '<leader>ja', '<cmd>JupyniumStartAndAttachToServer<cr>', desc = 'Launch Notebook' },
    { '<leader>js', '<cmd>JupyniumStartSync<cr>', desc = 'Sync File' },
  },
}
