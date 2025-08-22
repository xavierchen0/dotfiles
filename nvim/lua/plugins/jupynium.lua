return {
  'kiyoon/jupynium.nvim',
  opts = {
    python_host = vim.fn.getcwd() .. '/.venv/bin/python',
    jupyter_command = { 'uv', 'run', 'jupyter' },
  },
}
