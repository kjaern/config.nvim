return {
    'ThePrimeagen/gitnvim',
    -- dir = "C:/Users/Kenneth/Development/git-worktree.nvim",
    -- lazy = true,

    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local telescope = require 'telescope'
        require('git-worktree').setup()
        -- vim.keymap.set("n", "<leader>gw", "<CMD>require('telescope').extensions.git_worktree.git_worktrees()<CR>",
        vim.keymap.set('n', '<leader>ww', function(sdf)
            print(sdf)
            telescope.extensions.git_worktree.git_worktrees()
        end)
        vim.keymap.set('n', '<leader>wc', function()
            telescope.extensions.git_worktree.create_git_worktree()
        end)
        vim.keymap.set('n', '<leader>wq', function()
            telescope.extensions.git_worktree.switch_worktree()
        end)
    end,

}
