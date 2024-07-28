return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,

    init = function()
        require("catppuccin").setup({
            -- flavour = "mocha",
            dap = true,
            dap_ui = true,
            telescope = {
                enabled = true,
                -- style = "nvchad"
            },
            which_key = true,
            -- transparent_background = true,
            custom_highlights = function(colors)
                return {
                    LspSignatureActiveCust = { bg = colors.surface1, style = { "bold" } },
                }
            end,
            coc_nvim = true,
        })
    end,
}
