return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon.setup({})
        vim.keymap.set("n", "<M-a>", function()
            harpoon:list():add()
        end, { desc = "Add current filte to Harpoon List" })
        vim.keymap.set("n", "<M-d>", function()
            harpoon:list():remove()
        end, { desc = "Add current filte to Harpoon List" })
        vim.keymap.set("n", "<M-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Toggle Harpoon Menu" })
        vim.keymap.set("n", "<M-1>", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<M-2>", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<M-3>", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<M-4>", function()
            harpoon:list():select(4)
        end)
        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<S-Tab>", function()
            harpoon:list():prev({ ui_nav_wrap = true })
        end, { desc = "Switch to previous buffer in Harpoon List" })
        vim.keymap.set("n", "<Tab>", function()
            harpoon:list():next({ ui_nav_wrap = true })
        end, { desc = "Switch to next buffer in Harpoon List" })
    end,
}
