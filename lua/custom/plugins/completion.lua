return {
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        priority = 100,
        dependencies = {
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            -- { "L3MON4D3/LuaSnip", tag = "v2.*" },
            -- { "L3MON4D3/LuaSnip", tag = "v2.*", build = "luarocks install jsregexp" },
            -- { "L3MON4D3/LuaSnip", tag = "v2.*", build = "make install_jsregexp" },
            -- "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require "custom.completion"
        end,
    },
}
