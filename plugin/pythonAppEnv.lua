local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local actionState = require 'telescope.actions.state'

local function createEnv(envName, env)
    vim.cmd 'below split'
    vim.cmd 'terminal'
    print("kkn " .. env .. envName)
    vim.fn.feedkeys 'a'
    local enter = vim.api.nvim_replace_termcodes('<CR>', true, true, true)
    vim.fn.feedkeys('clear' .. enter)
    vim.fn.feedkeys("C:\\Users\\kknielsen\\AppData\\Local\\miniconda3\\Scripts\\activate.bat" .. enter)
    -- vim.fn.feedkeys('~/pythonNvim/Scripts/python.exe' .. enter)
    vim.fn.feedkeys('createDevEnv ' .. env .. ' ' .. envName .. ' ' .. enter)

    -- vim.fn.feedkeys("C:\\Users\\kknielsen\\AppData\\Local\\miniconda3\\Scripts\\deactivate.bat" .. enter)
    -- vim.fn.feedkeys('conda deactivate' .. envName .. enter)
end

local createAppEnv = function(opts, env)
    opts = opts or {}

    local cwDir = vim.fn.getcwd()
    --local cwdContent = vim.split(vim.fn.glob(cwDir .. '/apps/*'), '\n', { trimempty = true })
    local cwdContent = vim.fn.readdir(cwDir .. '/apps')
    for key, n in pairs(cwdContent) do
        cwdContent[key] = 'apps/' .. n
    end
    print(env)
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
                        createEnv(selection[1], env)
                        print('selected ' .. selection[1])
                        vim.print(cwdContent)
                    end
                end)
                return true
            end,
        })
        :find()
end

local decorateCreateEnv = function(env)
    return function(opts)
        createAppEnv(opts, env)
    end
end

vim.keymap.set('n', '<leader>kp', decorateCreateEnv('python'))
vim.keymap.set('n', '<leader>ka', decorateCreateEnv('conda'))

local Job = require 'plenary.job'
local createWorktree = function(opts)
    opts = opts or {}
    -- local return_val = 'test'

    local cwd = vim.loop.cwd()

    local stdout, code = Job:new({
        'git',
        'status',
        cwd = cwd,
    }):sync() -- or start()

    if code ~= 0 then
        print('failed')
        return
    else
        for k, v in pairs(stdout) do
            print(v)
        end
        stdout = table.concat(stdout, "\n")
        print(stdout)
    end


    print("godby\n goodby")

    -- print(return_val)
    -- print("hello?")

    -- vim.cmd 'below split'
    -- vim.cmd 'terminal'
    -- vim.fn.feedkeys 'a'
    -- local enter = vim.api.nvim_replace_termcodes('<CR>', true, true, true)
    -- vim.fn.feedkeys('clear' .. enter)
    -- vim.fn.feedkeys("git worktree list" .. enter)
    --
    -- local cwDir = vim.fn.getcwd()
    -- --local cwdContent = vim.split(vim.fn.glob(cwDir .. '/apps/*'), '\n', { trimempty = true })
    -- local cwdContent = vim.fn.readdir(cwDir .. '/apps')
    -- for key, n in pairs(cwdContent) do
    --     cwdContent[key] = 'apps/' .. n
    -- end
    -- pickers
    --     .new(opts, {
    --
    --         finder = finders.new_table {
    --             results = cwdContent,
    --             --{ 'blue', 'sdfasd' },
    --         },
    --         sorter = conf.generic_sorter(opts),
    --         attach_mappings = function(bufnr, map)
    --             actions.select_default:replace(function()
    --                 actions.close(bufnr)
    --                 local selection = actionState.get_selected_entry()
    --
    --                 if selection[1] == vim.fn.expand '%' then
    --                     print 'None selected'
    --                 else
    --                     createEnv(selection[1], env)
    --                     print('selected ' .. selection[1])
    --                     vim.print(cwdContent)
    --                 end
    --             end)
    --             return true
    --         end,
    --     })
    --     :find()
end

vim.keymap.set('n', '<leader>kw', createWorktree)
