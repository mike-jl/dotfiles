return { -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "garymjr/nvim-snippets",
            opts = {
                friendly_snippets = true,
                extended_filetypes = {
                    templ = { "html", "go" },
                },
            },
            dependencies = { "rafamadriz/friendly-snippets" },
        },
        -- Adds other completion capabilities.
        --  nvim-cmp does not ship with all sources by default. They are split
        --  into multiple repos for maintenance purposes.
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "onsails/lspkind.nvim",
        -- { "zbirenbaum/copilot-cmp", opts = {} },
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "symbol_text", -- show only symbol annotations
                    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    -- can also be a function to dynamically calculate max width such as
                    -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                    ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                    symbol_map = { Copilot = "" },

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function(entry, vim_item)
                        return vim_item
                    end,
                }),
            },
            -- experimental = { ghost_text = true },
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            completion = { completeopt = "menu,menuone,noinsert" },
            preselect = "None",
            view = {
                docs = { auto_open = true },
            },

            -- For an understanding of why these mappings were
            -- chosen, you will need to read `:help ins-completion`
            --
            -- No, but seriously. Please read `:help ins-completion`, it is really good!
            mapping = cmp.mapping.preset.insert({
                ["<M-x>"] = cmp.mapping(function()
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                end, { "i", "s", "n" }),

                -- Scroll the documentation window [d]own [u]p
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-u>"] = cmp.mapping.scroll_docs(4),

                -- Accept ([y]es) the completion.
                --  This will auto-import if your LSP supports it.
                --  This will expand snippets if the LSP sent a snippet.
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),

                -- If you prefer more traditional completion keymaps,
                -- you can uncomment the following lines
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),

                -- Manually trigger a completion from nvim-cmp.
                --  Generally you don't need this, because nvim-cmp will display
                --  completions whenever it has completion options available.
                ["<C-Space>"] = cmp.mapping.complete({}),
            }),
            sources = {
                {
                    name = "lazydev",
                    -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
                    group_index = 0,
                },
                { name = "nvim_lsp" },
                { name = "snippets" },
                { name = "path" },
                { name = "nvim_lsp_signature_help" },
                -- Copilot Source
                -- { name = "copilot", group_index = 2 },
            },
        })

        vim.keymap.set({ "i", "s" }, "<Tab>", function()
            return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>"
                or "<Tab>"
        end, { expr = true, silent = true })

        vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
            return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>"
                or "<S-Tab>"
        end, { expr = true, silent = true })
    end,
}
