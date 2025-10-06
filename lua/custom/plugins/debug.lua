local depend = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    'jay-babu/mason-nvim-dap.nvim',
}

dapEnsureInstalled = {}

for keyTable, langTable in pairs(OptLang) do
    for keyLang, lang in pairs(langTable) do
        -- print("setting up ".. keyLang)
        -- vim.print(lang)
        if not lang == nil then
        end
        if lang.dapDependency  then
            table.insert(depend, lang.dapDependency)
        -- else
        --     print("Skipping dap dependency " .. keyLang)
        end
        if lang.dapEnsureInstalled then
            table.insert(dapEnsureInstalled, lang.dapEnsureInstalled)
        -- else
        --     print("Skipping dap dependency " .. keyLang)
        end
    end
end
-- vim.print(dapEnsureInstalled)

return {
    -- NOTE: Yes, you can install new plugins here!
    'mfussenegger/nvim-dap',
    -- NOTE: And you can specify dependencies as well
    dependencies = depend,
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        require('mason-nvim-dap').setup {
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_setup = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = dapEnsureInstalled;
        }

        -- Basic debugging keymaps, feel free to change to your liking!
        vim.keymap.set("n", "<F4>", dap.restart, { desc = 'Debug: Restart' })
        vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
        vim.keymap.set('n', '<F6>', dap.terminate, { desc = 'Stop: Stop' })
        vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })
        vim.keymap.set('n', '<F10>', dap.step_into, { desc = 'Debug: Step Into' })
        vim.keymap.set('n', '<F11>', dap.step_over, { desc = 'Debug: Step Over' })
        vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug: Step Out' })
        vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
        vim.keymap.set('n', '<leader><F9>', function()
            dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end, { desc = 'Debug: Set Breakpoint' })

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close


        -- require('dap-zig').setup()
        -- require('dap-python').setup '~/pythonNvim/python.exe'
        for keyTable, langTable in pairs(OptLang) do
            for keyLang, lang in pairs(langTable) do
                -- print("setting up ".. keyLang)
                -- vim.print(lang)
                if lang.dapServer  then
                    lang.dapServer()
                -- else
                --     print("Skipping dap server " .. keyLang)
                end
            end
        end

        dap.adapters.lldb = {
            type = 'executable',
            command = 'C:\\Program Files\\LLVM\\bin\\lldb-dap.exe', -- adjust as needed, must be absolute path
            name = 'lldb',
        }
        dap.configurations.zig = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = 'C:/Users/Kenneth/Documents/Development/zig/hello/zig-out/bin/hello.exe', --'${workspaceFolder}/zig-out/bin/zig_hello_world.exe',
                cwd = 'C:/Users/Kenneth/Documents/Development/zig/hello/zig-out/bin',
                stopOnEntry = false,
                args = {},
            },
        }
    end,
}
