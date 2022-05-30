local M = {}

function M.setup()
  require("project_nvim").setup {
    silent_chdir = false,
  }
  require("telescope").load_extension("projects")
end

return M
