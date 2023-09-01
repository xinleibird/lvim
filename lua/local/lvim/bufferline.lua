-- Active bufferline
lvim.builtin.bufferline.active = true
lvim.builtin.bufferline.options.always_show_bufferline = true

local ok, catppuccin_bufferline = pcall(require, "catppuccin.groups.integrations.bufferline")
if ok then
  lvim.builtin.bufferline.highlights = catppuccin_bufferline.get()
end
