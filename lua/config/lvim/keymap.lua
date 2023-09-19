local OS = vim.loop.os_uname().sysname

if vim.g.neovide then
  -- Fullscreen toggle for neovide
  if OS == "Darwin" then
    lvim.keys.normal_mode["<D-C-f>"] = "<CMD>lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>"
  else
    lvim.keys.normal_mode["<M-C-f>"] = "<CMD>lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>"
  end
end

lvim.keys.normal_mode["<C-q>"] = false
