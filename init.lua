if vim.g.vscode then
  -- Just for VSCode-Neovim
  vim.cmd.runtime("vscode.vim")
else
  -- Initialize LunarVim
  local lvim = os.getenv("LUNARVIM_BASE_DIR") .. "/init.lua"
  dofile(lvim)
end
