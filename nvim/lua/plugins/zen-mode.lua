local M = {}

function M.setup()
  require("zen-mode").setup({
    window = {
      options = {
        signcolumn = "no",
      },
    },
  })
end

return M
