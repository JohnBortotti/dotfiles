-- Editor configs
vim.cmd([[
  set number
  set t_Co=256
  set encoding=UTF-8
  :set tabstop=2
  :set shiftwidth=2
  :set expandtab
]])

-- Tabs navigation
vim.cmd([[
  nmap <S-h> :tabp<CR>
  nmap <S-l> :tabn<CR>
]])

-- NvimTree
vim.cmd([[
  nmap <S-E> :NvimTreeToggle<CR> " ToggletTerm
  nmap <S-T> :ToggleTerm size=25<CR>
]])

-- Packer
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Colorscheme
-- vim.cmd([[ set bg=dark ]])
vim.cmd([[ set termguicolors ]])
vim.cmd([[ colorscheme sonokai ]])
