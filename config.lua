local function override_config(path)
  for _, file in
    ipairs(vim.fn.readdir(vim.fn.stdpath "config" .. "/lua/custom/" .. path, [[v:val =~ '\.lua$']]))
  do
    require("custom." .. path .. "." .. file:gsub("%.lua$", ""))
  end
end

local function custom_configurations()
  override_config "neovide"
  override_config "nvim"
  override_config "lvim"
end

local function load_lazy_packages()
  local plugins = {}

  -- Read optional config
  for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath "config" .. "/lua/packages", [[v:val =~ '\.lua$']])) do
    local lazy_package = require("packages." .. file:gsub("%.lua$", ""))
    table.insert(plugins, lazy_package)
  end

  lvim.plugins = plugins
end

custom_configurations()
load_lazy_packages()
