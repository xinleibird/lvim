local plugins = {
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "vimpostor/vim-lumen" },
  { "HiPhish/rainbow-delimiters.nvim" },
}

-- Read optional config
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath "config" .. "/lua/lazy", [[v:val =~ '\.lua$']])) do
  local t = require("lazy." .. file:gsub("%.lua$", ""))
  vim.list_extend(plugins, t)
end

lvim.plugins = plugins
