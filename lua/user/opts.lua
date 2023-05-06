-- Vim options
vim.opt.cmdheight      = 1
vim.opt.shiftwidth     = 2
vim.opt.tabstop        = 2
vim.opt.relativenumber = false
vim.opt.langmenu       = "en_US.UTF-8"
vim.opt.clipboard      = ""


-- Remove paste pattern for comment
vim.opt.formatoptions:remove({ "c", "r" })
