-- vim options
vim.opt.cmdheight = 1
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = false
vim.opt.langmenu = "en_US.UTF-8"
vim.opt.clipboard = ""
vim.opt.guicursor = "n-v-sm:block,c-i-ci-ve:ver25,r-cr-o:hor25"
-- vim.opt.wrap = true

-- Remove paste pattern for comment
vim.opt.formatoptions:remove { "c", "r" }

-- Use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"

-- General Lunarvim options
lvim.log.level = "info"

-- Format on save
lvim.format_on_save = {
  enabled = true,
  timeout = 500,
}

-- Change theme
lvim.colorscheme = "catppuccin" -- tokyonight | kanagawa | catppuccin
