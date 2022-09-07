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
  nmap <S-h> :bp<CR>
  nmap <S-l> :bn<CR>
]])

-- NvimTree
vim.cmd([[
  nmap <S-E> :NvimTreeToggle<CR> 
]])

-- ToggletTerm
vim.cmd([[
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
-- vim.cmd([[ let g:hybrid_transparent_background = 1 ]])
vim.cmd([[ colorscheme hybrid_material ]])
vim.cmd([[ set bg=dark ]])
vim.cmd([[ set fillchars=eob:\ ]])
vim.cmd([[ highlight SignColumn guibg=bg ]])
-- vim.cmd([[ highlight GitSignsAdd guibg=bg ctermbg=black guifg=green ]])
-- vim.cmd([[ highlight GitSignsChange guibg=bg ctermbg=black guifg=yellow ]])
-- vim.cmd([[ highlight GitSignsDelete guibg=bg ctermbg=black guifg=red ]])
