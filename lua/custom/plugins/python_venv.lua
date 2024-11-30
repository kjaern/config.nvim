return {
    -- dir = "C:\\Users\\Kenneth\\Development\\venv-selector.nvim",
    -- config = true,

    -- "linux-cultist/venv-selector.nvim",
    "kjaern/venv-selector.nvim",
    branch = "regexp", -- This is the regexp branch, use this for the new version
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,

    config = function()
        local function shorter_name(filename)
            print("filename")
            print(filename)
            return filename

            -- return filename:gsub(os.getenv("HOME"), "~"):gsub("/bin/python", "")
        end


        require("venv-selector").setup {
            settings = {
                options = {
                    -- on_venv_activate_callback = nil,           -- callback function for after a venv activates
                    -- enable_default_searches = true,            -- switches all default searches on/off
                    -- enable_cached_venvs = true,               -- use cached venvs that are activated automatically when a python file is registered with the LSP.
                    cached_venv_automatic_activation = false, -- if set to false, the VenvSelectCached command becomes available to manually activate them.venv
                    -- activate_venv_in_terminal = true,          -- activate the selected python interpreter in terminal windows opened from neovim
                    -- set_environment_variables = true,          -- sets VIRTUAL_ENV or CONDA_PREFIX environment variables
                    notify_user_on_venv_activation = true, -- notifies user on activation of the virtual env
                    -- search_timeout = 5,                        -- if a search takes longer than this many seconds, stop it and alert the user
                    debug = true,                          -- enables you to run the VenvSelectLog command to view debug logtrues
                    -- fd_binary_name = M.find_fd_command_name(), -- plugin looks for `fd` or `fdfind` but you can set something else here

                    -- telescope viewer options
                    on_telescope_result_callback = shorter_name, -- callback function for modifying telescope results
                    show_telescope_search_type = true,           -- shows which of the searches found which venv in telescope
                    -- telescope_filter_type = "substring" -- when you type something in telescope, filter by "substring" or "character"
                },
                search = {
                    anaconda_base = {
                        command = "fd python.exe$ --full-path -IH -a --color never",
                        type = "anaconda",
                    },
                },
            },
        }
    end,
    keys = {
        -- { ",v", "<cmd>VenvSelect<cr>" },
        -- { '<leader>vs', '<cmd>VenvSelect<cr>',      { show_telescope_search_type = true, file_ignore_patterns = { ".venv" } },
        { '<leader>vs', '<cmd>VenvSelect<cr>',      { show_telescope_search_type = true } },
        -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
        { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
        { '<leader>vv', function()
            print("Python env: " .. require("venv-selector").venv())
        end },
        { '<leader>vvv', function()
            print("Python env: " .. require("venv-selector").venv())
        end },
    },
    -- 'linux-cultist/venv-selector.nvim',
    -- -- 'kjaern/venv-selector.nvim',
    -- dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    --
    -- opts = {
    --     --     -- Your options go here
    --     name = { 'python', "venv", ".venv", "conda", ".conda" },
    --     --     -- auto_refresh = false
    --     --     parents = 0,
    --     anaconda = {
    --         python_executable = '.conda/python.exe',
    --         -- python_parent_dir = 'Scripts/',
    --         python_parent_dir = '.conda',
    --         -- dap_enabled = true,
    --         -- enable_debug_output = true,
    --     },
    --     python_parent_dir = 'Scripts/',
    -- },
    -- event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    -- keys = {
    --     -- Keymap to open VenvSelector to pick a venv.
    --     { '<leader>vs', '<cmd>VenvSelect<cr>' },
    --     -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    --     { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    -- },
    -- config = function()
    --     require('venv-selector').setup {
    --
    --         changed_venv_hooks = { require('venv-selector').hooks.pyright },
    --     }
    -- end,
}
