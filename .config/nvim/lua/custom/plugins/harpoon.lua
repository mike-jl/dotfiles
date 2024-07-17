return {
    "kimabrandt-flx/harpoon",
    branch = "develop",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

    config = function()
        local harpoon = require("harpoon")
        harpoon.setup()
        vim.keymap.set("n", "<M-a>", function()
            harpoon:list():add()
        end, { desc = "Add current filte to Harpoon List" })
        vim.keymap.set("n", "<M-d>", function()
            harpoon:list():remove()
        end, { desc = "Add current filte to Harpoon List" })
        vim.keymap.set("n", "<M-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Toggle Harpoon Menu" })

        for i = 1, 9 do
            vim.keymap.set("n", "<M-" .. i .. ">", function()
                require("harpoon"):list():select(i)
            end)
        end

        local extensions = require("harpoon.extensions")
        -- Setup keymaps for number row
        harpoon:extend(extensions.builtins.navigate_with_number())

        local function cur_buf_is_harpoon()
            local bufnr = vim.fn.bufnr(
                vim.loop.fs_realpath(harpoon:list().items[harpoon:list()._index].value)
            )
            return bufnr == vim.fn.bufnr()
        end

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<S-Tab>", function()
            if cur_buf_is_harpoon() then
                harpoon:list():prev({ ui_nav_wrap = true })
            else
                harpoon:list():select(harpoon:list()._index)
            end
        end, { desc = "Switch to previous buffer in Harpoon List" })
        vim.keymap.set("n", "<Tab>", function()
            if cur_buf_is_harpoon() then
                harpoon:list():next({ ui_nav_wrap = true })
            else
                harpoon:list():select(harpoon:list()._index)
            end
        end, { desc = "Switch to next buffer in Harpoon List" })

        local builtin = require("telescope.builtin")
        local function telescope_live_grep(harpoon_files)
            local file_paths = {}
            for _, item in pairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end
            builtin.live_grep({
                search_dirs = file_paths,
            })
        end

        vim.keymap.set("n", "<leader>sh", function()
            telescope_live_grep(harpoon:list())
        end, { desc = "Live grep harpoon files" })
    end,

    init = function()
        local harpoon = require("harpoon")
        -- check if nvim was started with no arguments or just a dir as argument
        -- if so, try to select the first item in the harpoon list
        if
            (vim.fn.argc() == 0 or (vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1))
            and (#harpoon:list().items > 0)
            and vim.api.nvim_get_option_value("buftype", { buf = 0 }) == ""
        then
            harpoon:list():select(1)
            return
        end
    end,
}
