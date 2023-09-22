if vim.g.vscode then
  -- Enable vim-plugin
  vim.cmd.runtime "plug.vim"
  -- Just for VSCode-Neovim
  vim.cmd.runtime "vscode.vim"
else
  -- Enable loader to reduce plugin load time
  if vim.loader then
    vim.loader.enable()
  end
  -- Initialize LunarVim like e.g. ~/.local/share/nvim/lvim/init.lua
  local lvim_runtime = os.getenv "LUNARVIM_BASE_DIR" .. "/init.lua"
  dofile(lvim_runtime)
end
