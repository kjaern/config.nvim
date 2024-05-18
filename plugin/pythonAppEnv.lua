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
    vim.fn.feedkeys('~/pythonNvim/Scripts/python.exe' .. enter)
    vim.fn.feedkeys('createDevEnv conda ' .. envName .. enter)
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

local function hello2()
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local nline =
    "# sdfasdfasdfasdfasdf asf asdf asd asdfasdf asdfa sd /nline #asdfasdfasdfasf sdfasdfas asdfasdf sdf<Enter>"
    -- call nvim_buf_set_lines(0, 0, 0, v:true, ["test text"])
    --	vim.api.nvim_set_lines(0,0,v:true,["asdf"])
    --# This software is(c) Xnovo Technology ApS 2024. All use is subject to
    --# separate license agreement.
    --# Created by K. Nielsen on Tue Apr 30 2024
    vim.api.nvim_set_current_line(nline)
    print(pos)
    vim.cmd('norm! j')
    -- vim.api.nvim_win_set_cursor({ 0 }, { 1, 1 })
    vim.api.nvim_set_current_line(nline)

    vim.api.nvim_win_set_cursor(0, pos)
    --	vim.api.nvim_line(nline, line)
end
vim.keymap.set('n', '<leader>ka', createAppEnv)
