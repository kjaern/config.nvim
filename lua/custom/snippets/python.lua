require("luasnip.session.snippet_collection").clear_snippets "python"
local ls = require "luasnip"

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
    ls.snippet("xn", fmt([[
    #
    # This software is(c) Xnovo Technology ApS {}. All use is subject to
    # separate license agreement.
    # Created by K. Nielsen on {}
    #

    ]], { vim.fn.strftime('%Y'), vim.fn.strftime('%a %d %b %Y') })),
})
