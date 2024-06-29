local ls = require "luasnip"

local s, sn = ls.snippet, ls.snippet_node
local i, d = ls.insert_node, ls.dynamic_node

local function uuid4()
    local id, _ = vim.fn.system('python -c "import uuid; print(uuid.uuid4())"'):gsub('\n', '')
    return id
end
-- ls.add_snippets("all", {
--     ls.parser.parse_snippet("uuid", uuid4()),
-- })
ls.add_snippets("all", {
    ls.snippet({
        trig = 'uuid',
        name = 'UUID',
        dscr = 'Generate a unique UUID'
    }, {
        ls.function_node(uuid4)
        -- ls.dynamic_node(1, function() return ls.snippet_node(nil, ls.insert_node(1, uuid4())) end)
        -- ls.dynamic_node(1, function() return ls.snippet_node(nil, uuid4()) end)
    }),
})

local function getDate()
    local id, _ = vim.fn.system(
            [===[python -c "from datetime import datetime; print(datetime.now().strftime('%Y/%m/%d'))"]===])
        :gsub(
            '\n', '')
    return id
end

ls.add_snippets("all", {
    s({
        trig = 'date',
        name = 'Date',
        dscr = 'Generate current date string'
    }, {
        -- ls.dynamic_node(1, function() return ls.snippet_node(nil, ls.insert_node(1, getDate())) end),
        ls.function_node(getDate)
    }),
})
