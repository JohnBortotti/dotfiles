local M = {}

function M.setup()
    require("nvim-autopairs").setup({
        enable_check_bracket_line = false
    })
end

return M
