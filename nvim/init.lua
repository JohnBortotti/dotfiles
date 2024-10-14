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

-- set leader
vim.cmd([[
let mapleader="\<Space>"
]])

-- custom function to toggle background (dark or light)
function toggleBackground()
  local current_bg = vim.o.background
  if current_bg == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end

require("lazy").setup("plugins")
