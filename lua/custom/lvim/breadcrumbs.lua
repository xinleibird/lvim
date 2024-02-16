-- Disable builtin breadcrumbs
-- lvim.builtin.breadcrumbs.active = false
local custom_exclude = { "NeogitStatus", "mason" }

vim.list_extend(lvim.builtin.breadcrumbs.winbar_filetype_exclude, custom_exclude)
