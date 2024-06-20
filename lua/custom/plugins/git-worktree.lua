return {
    'ThePrimeagen/git-worktree.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local telescope = require 'telescope'
        require('git-worktree').setup()
        -- vim.keymap.set("n", "<leader>gw", "<CMD>require('telescope').extensions.git_worktree.git_worktrees()<CR>",
        vim.keymap.set('n', '<leader>gw', function(sdf)
            print(sdf)
            telescope.extensions.git_worktree.git_worktrees()
        end)
        vim.keymap.set('n', '<leader>gwc', function()
            telescope.extensions.git_worktree.create_git_worktree()
        end)
    end,

}
