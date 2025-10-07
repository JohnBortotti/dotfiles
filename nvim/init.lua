local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- nvim configs
vim.cmd([[
  let mapleader="\<Space>"

  "general configs
  set number
  set relativenumber
  set t_Co=256
  set encoding=UTF-8
  set expandtab
  set shiftwidth=2
  set signcolumn=auto

  "netrw
  let netrw_liststyle=3
  let netrw_winsize=30

  "key mappigns
  nnoremap <leader>e :find .<CR>
  nnoremap <leader>h :noh<CR>
  nnoremap <leader>t :Telescope<CR>
  nnoremap <leader>x :bd<CR>
  nnoremap <leader>w :w<CR>
  nnoremap <leader>s :Telescope live_grep<CR>
  nnoremap <leader>p :Telescope find_files<CR>
]])

-- buffer format alias
vim.api.nvim_set_keymap('n', '<Leader>bf', '<Cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

require("lazy").setup("plugins")
