return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    commit = 'e76cb03',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() -- This is the function that runs, AFTER loading
        local harpoon = require 'harpoon'

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set('n', '<leader>h', function()
            harpoon:list():add()
        end)
        vim.keymap.set('n', '<leader>hh', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set('n', '<a-1>', function()
            harpoon:list():select(1)
        end)
        vim.keymap.set('n', '<a-2>', function()
            harpoon:list():select(2)
        end)
        vim.keymap.set('n', '<a-3>', function()
            harpoon:list():select(3)
        end)
        vim.keymap.set('n', '<a-4>', function()
            harpoon:list():select(4)
        end)

        vim.keymap.set('n', '<a-5>', function()
            harpoon:list():select(3)
        end)
        vim.keymap.set('n', '<a-6>', function()
            harpoon:list():select(4)
        end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set('n', '<C-S-P>', function()
            harpoon:list():prev()
        end)
        vim.keymap.set('n', '<C-S-N>', function()
            harpoon:list():next()
        end)
    end,
}
