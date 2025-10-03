return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                    -- Command line arguments for runner
                    -- Can also be a function to return dynamic values
                    -- args = { "--log-level", "DEBUG" },
                    -- Runner to use. Will use pytest if available by default.
                    -- Can be a function to return dynamic value.
                    runner = "unittest",
                    strategy = "dap",
                    -- Custom python path for the runner.
                    -- Can be a string or a list of strings.
                    -- Can also be a function to return dynamic value.
                    -- If not provided, the path will be inferred by checking for
                    -- virtual envs in the local directory and for Pipenev/Poetry configs
                    python = function()
                        print("getting python" .. vim.lsp.buf_get_clients()[1]["settings"]["python"].pythonPath)
                        return vim.lsp.buf_get_clients()[1]["settings"]["python"].pythonPath
                    end
                    -- Returns if a given file path is a test file.
                    -- NB: This function is called a lot so don't perform any heavy tasks within it.
                    -- is_test_file = function(file_path)
                    --   ...
                    -- end,
                    -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
                    -- instances for files containing a parametrize mark (default: false)
                    -- pytest_discover_instances = true,

                })
            }
        })
    end,
    keys = {
        { "<C-F5>",   "<cmd>Neotest run<cr>" },
        { "<leader>to", "<cmd>Neotest output<cr>" },
        { "<leader>ts", "<cmd>Neotest summary<cr>" },
        { "<leader>ta", "<cmd> lua require('neotest').run({suite = true})<cr>" },
    }
}
