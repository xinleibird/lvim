local function override_config(path)
  for _, file in
    ipairs(vim.fn.readdir(vim.fn.stdpath "config" .. "/lua/users/configs/" .. path, [[v:val =~ '\.lua$']]))
  do
    require("users.configs." .. path .. "." .. file:gsub("%.lua$", ""))
  end
end

local function override_configs()
  override_config "neovide"
  override_config "nvim"
  override_config "lvim"
end

local function load_packages()
  local plugins = {}

  -- Read optional config
  for _, file in
    ipairs(vim.fn.readdir(vim.fn.stdpath "config" .. "/lua/users/packages", [[v:val =~ '\.lua$']]))
  do
    local t = require("users.packages." .. file:gsub("%.lua$", ""))
    vim.list_extend(plugins, t)
  end

  lvim.plugins = plugins
end

override_configs()
load_packages()
