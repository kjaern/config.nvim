local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local actionState = require 'telescope.actions.state'

local function createEnv(envName)
    vim.cmd 'below split'
    vim.cmd 'terminal'
    vim.fn.feedkeys 'a'
    local enter = vim.api.nvim_replace_termcodes('<CR>', true, true, true)
    vim.fn.feedkeys('clear' .. enter)
    -- vim.fn.feedkeys('~/pythonNvim/Scripts/python.exe' .. enter)
    vim.fn.feedkeys('createDevEnv python ' .. envName .. enter)
    vim.fn.feedkeys('conda deactivate' .. envName .. enter)
end

local createAppEnv = function(opts)
    opts = opts or {}

    local cwDir = vim.fn.getcwd()
    --local cwdContent = vim.split(vim.fn.glob(cwDir .. '/apps/*'), '\n', { trimempty = true })
    local cwdContent = vim.fn.readdir(cwDir .. '/apps')
    for key, n in pairs(cwdContent) do
        cwdContent[key] = 'apps/' .. n
    end
    print(cwdContent)
    pickers
        .new(opts, {

            finder = finders.new_table {
                results = cwdContent,
                --{ 'blue', 'sdfasd' },
            },
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(bufnr, map)
                actions.select_default:replace(function()
                    actions.close(bufnr)
                    local selection = actionState.get_selected_entry()

                    if selection[1] == vim.fn.expand '%' then
                        print 'None selected'
                    else
                        createEnv(selection[1])
                        print('selected ' .. selection[1])
                        vim.print(cwdContent)
                    end
                end)
                return true
            end,
        })
        :find()
end

vim.keymap.set('n', '<leader>ka', createAppEnv)
