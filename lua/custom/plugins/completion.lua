-- return {
--     "hrsh7th/nvim-cmp",
--     lazy = false,
--     priority = 100,
--     dependencies = {
--         "onsails/lspkind.nvim",
--         "hrsh7th/cmp-nvim-lsp",
--         "hrsh7th/cmp-path",
--         "hrsh7th/cmp-buffer",
--         'hrsh7th/cmp-vsnip',
--         'hrsh7th/vim-vsnip',
--         -- { "L3MON4D3/LuaSnip", tag = "v2.*" },
--         -- { "L3MON4D3/LuaSnip", tag = "v2.*", build = "luarocks install jsregexp" },
--         -- { "L3MON4D3/LuaSnip", tag = "v2.*", build = "make install_jsregexp" },
--         -- "saadparwaiz1/cmp_luasnip",
--     },
--     config = function()
--         require "custom.completion"
--     end,
-- }

return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),

            })

            local ls = require "luasnip"
            ls.config.set_config {
                history = false,
                updateevents = "TextChanged,TextChangedI",
            }

            for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
                loadfile(ft_path)()
            end

            vim.keymap.set({ "i", "s" }, "<c-k>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<c-j>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })
        end,
        -- local ls = require "luasnip"
        -- ls.config.set_config {
        --     history = false,
        --     updateevents = "TextChanged,TextChangedI",
        -- }
        --
        -- for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
        --     loadfile(ft_path)()
        -- end
        -- vim.keymap.set({ "i", "s" }, "<c-k>", function()
        --     if ls.expand_or_jumpable() then
        --         ls.expand_or_jump()
        --     end
        -- end, { silent = true })
        --
        -- vim.keymap.set({ "i", "s" }, "<c-j>", function()
        --     if ls.jumpable(-1) then
        --         ls.jump(-1)
        --     end
        -- end, { silent = true })
    },
}
-- fdsasdfas asdf sdka n kan vi
-- k, f)
