vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.fn.exists('g:os') == 0 then
    local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
    if is_windows then
        vim.cmd("language en_US")
    end
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
local ok, err = os.rename("./lua/optionalPlugins.lua", "./lua/optionalPlugins.lua");
if not ok then
    print("Plugins selection missing, copying optionalPluginsDefaults to optionalPlugins")
    infile = io.open("./lua/optionalPluginsDefaults.lua", "r")
    instr = infile:read("*a")
    infile:close()

    outfile = io.open("./lua/optionalPlugins.lua", "w")
    outfile:write(instr)
    outfile:close()
end


local optPlugin = require("optionalPlugins")
for key, val in pairs(optPlugin) do
    print(key, val)
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = optPlugin,
    change_detection = {
        notify = false,
    },
})
