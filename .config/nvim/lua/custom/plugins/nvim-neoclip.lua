local function is_whitespace(line)
    return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
    for _, entry in ipairs(tbl) do
        if not check(entry) then
            return false
        end
    end
    return true
end

return {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
        -- you'll need at least one of these
        { "nvim-telescope/telescope.nvim" },
        -- {'ibhagwan/fzf-lua'},
        { "kkharji/sqlite.lua", module = "sqlite" },
    },
    opts = {
        enable_persistent_history = true,
        continuous_sync = true,
        filter = function(data)
            return not all(data.event.regcontents, is_whitespace)
        end,
    },
    keys = {
        { "<leader>sy", "<cmd>Telescope neoclip<cr>", desc = "[S]earch [Y]anks" },
    },
}
