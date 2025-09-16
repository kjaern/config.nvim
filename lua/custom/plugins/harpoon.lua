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
        end, { desc = "Harpoon: toggle quick menu" })

        vim.keymap.set('n', '<a-1>', function()
            harpoon:list():select(1)
        end, { desc = "Harpoon: jump to buffer 1" })
        vim.keymap.set('n', '<a-2>', function()
            harpoon:list():select(2)
        end, { desc = "Harpoon: jump to buffer 2" })
        vim.keymap.set('n', '<a-3>', function()
            harpoon:list():select(3)
        end, { desc = "Harpoon: jump to buffer 3" })
        vim.keymap.set('n', '<a-4>', function()
            harpoon:list():select(4)
        end, { desc = "Harpoon: jump to buffer 4" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set('n', '<C-S-P>', function()
            harpoon:list():prev()
        end, { desc = "Harpoon: jump to previous buffer" })
        vim.keymap.set('n', '<C-S-N>', function()
            harpoon:list():next()
        end, { desc = "Harpoon: jump to next buffer" })
    end,
}
