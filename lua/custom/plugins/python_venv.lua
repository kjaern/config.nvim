return {
  'linux-cultist/venv-selector.nvim',
  --'kjaern/venv-selector.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  opts = {
    -- Your options go here
    name = { 'python', 'conda' },
    -- auto_refresh = false
    parents = 0,
    anaconda = {
      --  python_executable = 'python.exe',
      python_parent_dir = 'Scripts/',
      -- python_parent_dir = '.',
      -- dap_enabled = true,
      -- enable_debug_output = true,
    },
    python_parent_dir = 'Scripts/',
  },
  event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>vs', '<cmd>VenvSelect<cr>' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
  },
  -- config = function()
  --   require('venv-selector').setup {
  --
  --     changed_venv_hooks = { require('venv-selector').hooks.pyright },
  --   }
  -- end,
}
