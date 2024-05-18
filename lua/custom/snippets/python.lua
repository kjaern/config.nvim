require("luasnip.session.snippet_collection").clear_snippets "python"
print("python")
local ls = require "luasnip"

local s, sn = ls.snippet, ls.snippet_node
local t, i, d = ls.text_node, ls.insert_node, ls.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
    s("xn", fmt([[
    #
    # This software is(c) Xnovo Technology ApS {}. All use is subject to
    # separate license agreement.
    # Created by K. Nielsen on {}
    #

    ]], { vim.fn.strftime('%Y'), vim.fn.strftime('%a %d %b %Y') })),
})
