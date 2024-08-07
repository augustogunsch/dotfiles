-- Disable newtrw
-- required by nvim-tree
vim.opt.guicursor = "a:blinkon0"

-- Disable netrw explorer
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

vim.opt.termguicolors = true

vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.list = true
vim.opt.listchars = {
  tab = "*·",
  lead = "·",
  trail = "~",
  extends = ">",
  precedes = "<"
}

vim.opt.number = true
vim.opt.relativenumber = true

-- To avoid bad habits
vim.opt.mouse = ""

vim.opt.colorcolumn = "120"
