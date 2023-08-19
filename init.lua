if vim.g.vscode then
  -- Enable vim-plugin
  vim.cmd.runtime "plug.vim"
  -- Just for VSCode-Neovim
  vim.cmd.runtime "vscode.vim"
else
  -- Initialize LunarVim
  local lvim_runtime = os.getenv "LUNARVIM_BASE_DIR" .. "/init.lua"
  dofile(lvim_runtime)
end
