if vim.g.vscode then
  -- just for VSCode-Neovim
  vim.cmd.runtime("vscode.vim")
else
  -- initialize LunarVim
  local lvim_runtime = os.getenv("LUNARVIM_BASE_DIR") .. "/init.lua"
  dofile(lvim_runtime)
end
