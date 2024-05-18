local ls = require "luasnip"

local s, sn = ls.snippet, ls.snippet_node
local i, d = ls.insert_node, ls.dynamic_node

local function uuid4()
    local id, _ = vim.fn.system('python -c "import uuid; print(uuid.uuid4())"'):gsub('\n', '')
    return id
end
ls.add_snippets("all", {
    s({
        trig = 'uuid',
        name = 'UUID',
        dscr = 'Generate a unique UUID'
    }, {
        d(1, function() return sn(nil, i(1, uuid4())) end)
    }),
})
