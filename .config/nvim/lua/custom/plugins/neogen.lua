return {
    "danymat/neogen",
    opts = {
        snippet_engine = "luasnip",
    },
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
    keys = {
        {
            "<Leader>nf",
            function()
                require("neogen").generate({})
            end,
            desc = "Generate Annotations",
        },
    },
}
