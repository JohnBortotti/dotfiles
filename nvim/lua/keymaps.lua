local keymap = vim.api.nvim_set_keymap

local default_map = { noremap = true, silent = true }
local expression_map = { noremap = true, expr = true, silent = true }

-- Telescope
keymap('n', '<S-T>', ':Telescope<CR>', default_map)