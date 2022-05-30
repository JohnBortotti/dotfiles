vim.cmd([[
set number
set t_Co=256
set encoding=UTF-8

" NvimTree
nmap <S-E> :NvimTreeToggle<CR>

" ToggletTerm
nmap <S-T> :ToggleTerm<CR>
]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- colorscheme
-- vim.cmd([[ set bg=dark ]])
vim.cmd([[
let g:sonokai_better_performance = 1
]])

vim.cmd([[ set termguicolors ]])
vim.cmd([[ colorscheme sonokai ]])
