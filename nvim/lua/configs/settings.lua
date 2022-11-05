-- Editor configs
vim.cmd([[
  set number
  set t_Co=256
  set encoding=UTF-8
]])

-- Nerdtree
vim.cmd([[
  let NERDTreeShowHidden=1
  nmap <S-E> :NERDTreeToggle<CR> 
]])

-- Telescope
vim.cmd([[
  nmap <S-T> :Telescope<CR>
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

-- Colorscheme
vim.cmd([[ set fillchars=eob:\ ]])
