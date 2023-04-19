-- Editor configs
vim.cmd([[
  set number
  set t_Co=256
  set encoding=UTF-8
]])

-- Netrw
vim.cmd([[
  let netrw_liststyle=3
]])

-- Disable sign column
vim.cmd([[
  set scl=no
]])

-- Packer
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- colorscheme
vim.cmd([[ set fillchars=eob:\ ]])
-- vim.cmd([[ colorscheme kanagawa ]])
