-- Disable builtin breadcrumbs
-- lvim.builtin.breadcrumbs.active = false
-- lvim.builtin.breadcrumbs.winbar_filetype_exclude =

vim.list_extend(lvim.builtin.breadcrumbs.winbar_filetype_exclude, { "NeogitStatus" })
